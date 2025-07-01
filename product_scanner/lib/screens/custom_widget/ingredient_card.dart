import 'package:flutter/material.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class IngredientCard extends StatefulWidget {
  const IngredientCard({required this.isVerified, super.key});

  final bool isVerified;

  @override
  State<IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends State<IngredientCard> {
  final List<String> _mockIngredients = [
    'Hyaluronic Acid',
    'Vitamin C',
    'Retinol',
    'Niacinamide',
    'Salicylic Acid',
    'Glycolic Acid',
    'Ceramides',
    'Peptides',
    'Zinc Oxide',
  ];

  @override
  Widget build(BuildContext context) {
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
              const Icon(Icons.list_alt, color: kWhiteColor24, size: 24),
              const SizedBox(width: 12),
              const Text(
                "Ingredients",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                _mockIngredients.map((ingredient) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color:
                          widget.isVerified
                              ? kBlueColor.withValues(alpha: 0.1)
                              : kGreyColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color:
                            widget.isVerified
                                ? kBlueColor.withValues(alpha: 0.5)
                                : kGreyColor.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      ingredient,
                      style: TextStyle(
                        color: widget.isVerified ? kBlueColor : kGreyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
