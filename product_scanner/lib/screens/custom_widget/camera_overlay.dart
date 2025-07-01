import 'package:flutter/material.dart';
import 'package:product_scanner/screens/custom_widget/corner_stone_indicator.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class CameraOverlay extends StatefulWidget {
  const CameraOverlay({super.key});

  @override
  State<CameraOverlay> createState() => _CameraOverlayState();
}

class _CameraOverlayState extends State<CameraOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Simulate camera noise
        Positioned.fill(
          child: Opacity(
            opacity: 0.1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/400/600?grayscale',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        // Scan frame
        Center(
          child: Container(
            width: 250,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: kGreenAccentColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                // Corner indicators
                ...List.generate(
                  4,
                  (index) => CornerStoneIndicator(index: index),
                ),

                // Center crosshair
                Center(
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: kGreenAccentColor, width: 2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.center_focus_strong,
                        color: kGreenAccentColor,
                        size: 16,
                      ),
                    ),
                  ),
                ),

                // instructions
                const Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Text(
                    'Position barcode within the frame',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
