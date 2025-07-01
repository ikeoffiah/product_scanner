import 'dart:async';
import 'dart:math';
import 'package:product_scanner/screens/custom_widget/control_panel.dart';
import 'package:product_scanner/screens/custom_widget/scanner_view.dart';
import 'package:product_scanner/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:product_scanner/screens/helper/colors.dart';
import 'package:product_scanner/screens/result_screen.dart';

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
    _scanAnimationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _startScanning() {
    setState(() {
      _isScanning = true;
      _cameraActive = true;
    });
    _scanAnimationController.repeat();

    // Simulate scanning process
    Timer(const Duration(seconds: 3), () {
      _scanAnimationController.stop();
      _showResult();
    });
  }

  void _simulateImageUpload() {
    setState(() {
      _isScanning = true;
    });

    // Simulate image processing
    Timer(const Duration(seconds: 2), () {
      _showResult();
    });
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
            (context) =>
                isVerified ? const ResultScreen() : const ErrorScreen(),
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
                child: ScannerView(cameraActive: _cameraActive),
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
