import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:product_scanner/screens/custom_widget/control_panel.dart';
import 'package:product_scanner/screens/custom_widget/scanner_view.dart';
import 'package:flutter/material.dart';
import 'package:product_scanner/screens/helper/colors.dart';
import 'package:product_scanner/screens/result_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with TickerProviderStateMixin {
  late AnimationController _scanAnimationController;
  late Animation<double> _scanAnimation;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  bool _isScanning = false;
  bool _cameraActive = false;
  QRViewController? _qrController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  String? _scannedBarcode;
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _scanAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scanAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _scanAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _pulseAnimation = Tween<double>(begin: 1, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _qrController?.dispose();
    _scanAnimationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null && !_isScanning) {
        _scannedBarcode = scanData.code;
        _processScanResult();
      }
    });
  }

  void _processScanResult() {
    setState(() {
      _isScanning = true;
    });

    // Simulate processing time
    Timer(const Duration(seconds: 2), () {
      _showResult();
    });
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
          _isScanning = true;
        });

        // Simulate image processing
        Timer(const Duration(seconds: 3), () {
          _showResult();
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _startScanning() {
    setState(() {
      _isScanning = false;
      _cameraActive = true;
      _selectedImage = null;
      _scannedBarcode = null;
    });
  }

  void _simulateImageUpload() {
    _pickImage();
  }

  void _showResult() {
    setState(() {
      _isScanning = false;
      _cameraActive = false;
    });

    final isVerified = Random().nextBool();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ResultScreen(
              barCode: '',
              isVerified: isVerified,
              scannedBarcode: _scannedBarcode,
              selectedImage: _selectedImage,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Scan Product'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.history), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryColor, kSecondaryColor],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: ScannerView(
                  cameraActive: _cameraActive,
                  scanAnimation: _scanAnimation,
                  isScanning: _isScanning,
                  pulseAnimation: _pulseAnimation,
                ),
              ),
              Expanded(
                flex: 1,
                child: ControlPanel(
                  isScanning: _isScanning,
                  startScanning: _startScanning,
                  simulateImageUpload: _simulateImageUpload,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
