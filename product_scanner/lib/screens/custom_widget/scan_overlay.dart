import 'package:flutter/material.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class ScanOverlay extends StatefulWidget {
  const ScanOverlay({required this.scanAnimation, super.key});

  final Animation<double> scanAnimation;

  @override
  State<ScanOverlay> createState() => _ScanOverlayState();
}

class _ScanOverlayState extends State<ScanOverlay> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.scanAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top:
                  MediaQuery.of(context).size.height * 0.2 +
                  (MediaQuery.of(context).size.height *
                      0.4 *
                      widget.scanAnimation.value),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      kGreenAccentColor,
                      kGreenAccentColor,
                      Colors.transparent,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kGreenAccentColor,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
