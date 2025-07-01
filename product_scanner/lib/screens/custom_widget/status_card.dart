import 'package:flutter/material.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class StatusCard extends StatefulWidget {
  const StatusCard({required this.isVerified, super.key});
  final bool isVerified;

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:
            widget.isVerified
                ? kGreenColor.withValues(alpha: 0.1)
                : kOrangeColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.isVerified ? kGreenColor : kOrangeColor,
          width: 2,
        ),
      ),

      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: widget.isVerified ? kGreenColor : kOrangeColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              widget.isVerified
                  ? Icons.check_circle
                  : Icons.help_center_outlined,
              color: kWhiteColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.isVerified ? 'Product Verified' : 'Unknown Product',
            style: TextStyle(
              color: widget.isVerified ? kGreenColor : kOrangeColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.isVerified
                ? 'This product has been found in our database'
                : 'This product is not in our database yet',
            style: const TextStyle(color: kWhiteColor, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
