import 'dart:io';

import 'package:flutter/material.dart';

class ScannedImageCard extends StatefulWidget {
  const ScannedImageCard({required this.selectedImage, super.key});

  final File? selectedImage;

  @override
  State<ScannedImageCard> createState() => _ScannedImageCardState();
}

class _ScannedImageCardState extends State<ScannedImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Scanned Image',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.greenAccent, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(widget.selectedImage!, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
