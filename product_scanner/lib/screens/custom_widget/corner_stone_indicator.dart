import 'package:flutter/material.dart';
import 'package:product_scanner/screens/helper/colors.dart';

class CornerStoneIndicator extends StatefulWidget {
  const CornerStoneIndicator({required this.index, super.key});

  final int index;

  @override
  State<CornerStoneIndicator> createState() => _CornerStoneIndicatorState();
}

class _CornerStoneIndicatorState extends State<CornerStoneIndicator> {
  final positions = [
    const Alignment(-1, -1),
    const Alignment(1, -1),
    const Alignment(-1, 1),
    const Alignment(1, 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: positions[widget.index],
      child: Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: kGreenAccentColor, width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
