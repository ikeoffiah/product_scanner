import 'package:flutter/material.dart';
import 'package:product_scanner/screens/custom_widget/action_button.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({
    required this.isScanning,
    required this.startScanning,
    required this.simulateImageUpload,
    super.key,
  });

  final bool isScanning;
  final VoidCallback startScanning;
  final VoidCallback simulateImageUpload;

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActionButton(
                icon: Icons.camera_alt,
                label: 'Scan Camera',
                onPressed: widget.isScanning ? null : widget.startScanning,
                primary: true,
              ),
              ActionButton(
                icon: Icons.photo_library,
                label: 'Upload Image',
                onPressed:
                    widget.isScanning ? null : widget.simulateImageUpload,
                primary: true,
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (widget.isScanning)
            const LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kGreenAccentColor),
              backgroundColor: kWhiteColor24,
            ),
        ],
      ),
    );
  }
}
