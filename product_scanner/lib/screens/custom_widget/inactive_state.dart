import 'package:flutter/material.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class InactiveState extends StatefulWidget {
  const InactiveState({
    required this.pulseAnimation,
    required this.scan,
    super.key,
  });
  final Animation<double> pulseAnimation;
  final VoidCallback scan;

  @override
  State<InactiveState> createState() => _InactiveStateState();
}

class _InactiveStateState extends State<InactiveState> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.scan,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: widget.pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: widget.pulseAnimation.value,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: kWhiteColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: kWhiteColor24, width: 24),
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner,
                      color: kWhiteColor24,
                      size: 40,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            const Text(
              'Tap to start scanning',
              style: TextStyle(
                color: kWhiteColor24,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
