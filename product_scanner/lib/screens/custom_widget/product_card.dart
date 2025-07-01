import 'dart:math';

import 'package:flutter/material.dart';
import 'package:product_scanner/models/product_model.dart';
import 'package:product_scanner/screens/custom_widget/info_row.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    required this.isVerified,
    required this.scannedBarCode,
    this.barcode,
    super.key,
  });
  final bool isVerified;
  final String? barcode;
  final String? scannedBarCode;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final List<ProductModel> _mockProducts = [
      ProductModel(
        productName: 'Hydra Glow Face Serum',
        barcode: widget.scannedBarCode ?? '8901234567890',
        category: 'Skincare',
        productBrand: 'Luminous Glow',
      ),
      ProductModel(
        productName: 'Velvet Matte Lipstick',
        barcode: widget.scannedBarCode ?? '8901234567891',
        category: 'Makeup',
        productBrand: 'ColorMuse',
      ),
      ProductModel(
        productName: 'Argan Oil Hair Mask',
        barcode: widget.scannedBarCode ?? '8901234567892',
        category: 'Haircare',
        productBrand: 'NaturEssence',
      ),
      ProductModel(
        productName: '24H Longwear Foundation',
        barcode: widget.scannedBarCode ?? '8901234567893',
        category: 'Makeup',
        productBrand: 'FlawlessMe',
      ),
      ProductModel(
        productName: 'Vitamin C Night Cream',
        barcode: widget.scannedBarCode ?? '8901234567894',
        category: 'Skincare',
        productBrand: 'GlowUp',
      ),
      ProductModel(
        productName: 'Aloe Vera Face Wash',
        barcode: widget.scannedBarCode ?? '8901234567895',
        category: 'Skincare',
        productBrand: 'HerbalBliss',
      ),
      ProductModel(
        productName: 'Waterproof Mascara',
        barcode: widget.scannedBarCode ?? '8901234567896',
        category: 'Makeup',
        productBrand: 'LashBoost',
      ),
      ProductModel(
        productName: 'Rose Water Toner',
        barcode: widget.scannedBarCode ?? '8901234567897',
        category: 'Skincare',
        productBrand: 'PureSkin',
      ),
      ProductModel(
        productName: 'Shea Butter Body Lotion',
        barcode: widget.scannedBarCode ?? '8901234567898',
        category: 'Bodycare',
        productBrand: 'SoftSilk',
      ),
      ProductModel(
        productName: 'Tea Tree Acne Gel',
        barcode: widget.scannedBarCode ?? '8901234567899',
        category: 'Skincare',
        productBrand: 'ClearDerm',
      ),
    ];
    final ProductModel product =
        widget.barcode != null
            ? ProductModel(
              productName: 'Scanned Product',
              barcode: widget.scannedBarCode!,
              category: 'Unknown',
              productBrand: 'Unknown',
            )
            : widget.isVerified
            ? _mockProducts[Random().nextInt(_mockProducts.length)]
            : ProductModel(
              productName: "Unknown Product",
              barcode: "000000000000",
              category: "Unknown Category",
              productBrand: "Unknown Brand",
            );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhiteColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kWhiteColor24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: kWhiteColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.inventory_2,
                  color: kWhiteColor,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Information',
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Scanned!!',
                      style: const TextStyle(color: kWhiteColor, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          InfoRow(label: "Name", value: product.productName),
          InfoRow(label: "Brand", value: product.productBrand),
          InfoRow(label: "Category", value: product.category),
          InfoRow(label: "Barcode", value: product.barcode),
        ],
      ),
    );
  }
}
