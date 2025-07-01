import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product_scanner/screens/custom_widget/action_buttons.dart';
import 'package:product_scanner/screens/custom_widget/ingredient_card.dart';
import 'package:product_scanner/screens/custom_widget/product_card.dart';
import 'package:product_scanner/screens/custom_widget/scanned_image_card.dart';
import 'package:product_scanner/screens/custom_widget/status_card.dart';

class ResultContent extends StatefulWidget {
  const ResultContent({
    required this.selectedImage,
    this.scannedBarCode,
    this.barcode,
    super.key,
  });

  final String? barcode;
  final File? selectedImage;
  final String? scannedBarCode;

  @override
  State<ResultContent> createState() => _ResultContentState();
}

class _ResultContentState extends State<ResultContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          StatusCard(isVerified: widget.scannedBarCode != null),
          const SizedBox(height: 30),
          if (widget.selectedImage != null) ...[
            ScannedImageCard(selectedImage: widget.selectedImage),
            const SizedBox(height: 30),
          ],
          const SizedBox(height: 30),
          ProductCard(
            scannedBarCode: widget.scannedBarCode,
            isVerified: widget.scannedBarCode != null,
            barcode: widget.barcode,
          ),
          const SizedBox(height: 30),
          IngredientCard(isVerified: widget.scannedBarCode != null),
          const SizedBox(height: 30),
          ActionButtons(),
        ],
      ),
    );
  }
}
