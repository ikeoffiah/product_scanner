import 'package:flutter/material.dart';
import 'package:product_scanner/screens/custom_widget/camera_overlay.dart';
import 'package:product_scanner/screens/custom_widget/inactive_state.dart';
import 'package:product_scanner/screens/custom_widget/loading_overlay.dart';
import 'package:product_scanner/screens/custom_widget/scan_overlay.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({
    required this.cameraActive,
    required this.scanAnimation,
    required this.isScanning,
    required this.pulseAnimation,
    super.key,
  });

  final bool cameraActive;
  final bool isScanning;
  final Animation<double> scanAnimation;
  final Animation<double> pulseAnimation;

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
              child:
                  widget.cameraActive
                      ? CameraOverlay()
                      : InactiveState(pulseAnimation: widget.pulseAnimation),
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
