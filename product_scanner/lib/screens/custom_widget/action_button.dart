import 'package:flutter/material.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.primary,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool primary;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ElevatedButton.icon(
          onPressed: widget.onPressed,
          label: Text(
            widget.label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: widget.primary ? kBlackColor : kWhiteColor,
            backgroundColor:
                widget.primary ? kGreenAccentColor : Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side:
                  widget.primary
                      ? BorderSide.none
                      : const BorderSide(color: kWhiteColor24),
            ),
            elevation: widget.primary ? 8 : 0,
          ),
        ),
      ),
    );
  }
}
