import 'package:flutter/material.dart';
import 'package:product_scanner/screens/custom_widget/camera_overlay.dart';
import 'package:product_scanner/screens/custom_widget/inactive_state.dart';
import 'package:product_scanner/screens/custom_widget/loading_overlay.dart';
import 'package:product_scanner/screens/custom_widget/scan_overlay.dart';
import 'package:product_scanner/screens/helper/colors.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({
    required this.cameraActive,
    required this.scanAnimation,
    required this.isScanning,
    required this.pulseAnimation,
    this.onBarcodeScanned,
    this.onTapToScan,
    super.key,
  });

  final bool cameraActive;
  final bool isScanning;
  final Animation<double> scanAnimation;
  final Animation<double> pulseAnimation;
  final void Function(String barcode)? onBarcodeScanned;
  final VoidCallback? onTapToScan;

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: widget.cameraActive ? kGreenAccentColor : kWhiteColor24,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color:
                widget.cameraActive
                    ? kGreenAccentColor.withValues(alpha: 0.3)
                    : Colors.transparent,
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            if (widget.cameraActive)
              SimpleBarcodeScanner(
                onScanned: (barcode) {
                  if (barcode.isNotEmpty && widget.onBarcodeScanned != null) {
                    widget.onBarcodeScanned!(barcode);
                  }
                },
                continuous: false,
                onBarcodeViewCreated: (controller) {},
              )
            else
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:
                        widget.cameraActive
                            ? [Colors.black87, Colors.black54]
                            : [Colors.grey[900]!, Colors.grey[800]!],
                  ),
                ),
                child: GestureDetector(
                  onTap: widget.onTapToScan,
                  child: InactiveState(pulseAnimation: widget.pulseAnimation),
                ),
              ),

            if (widget.isScanning && widget.cameraActive)
              ScanOverlay(scanAnimation: widget.scanAnimation),

            if (widget.isScanning && !widget.cameraActive) LoadingOverlay(),
          ],
        ),
      ),
    );
  }
}
