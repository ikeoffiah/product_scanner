import 'package:flutter/material.dart';

class ResultContent extends StatefulWidget {
  const ResultContent({super.key});

  @override
  State<ResultContent> createState() => _ResultContentState();
}

class _ResultContentState extends State<ResultContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: [const SizedBox(height: 20)]),
    );
  }
}
