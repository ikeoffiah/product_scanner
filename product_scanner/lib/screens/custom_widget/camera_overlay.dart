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
                ...List.generate(
                  4,
                  (index) => CornerStoneIndicator(index: index),
                ),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
