import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.label, required this.variant});
  final String label;
  final String variant;

  getStyle() {
    switch (variant) {
      case 'primaryTitle':
        return const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontFamily: 'Billabong');
      case 'primaryHeading':
        return const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontFamily: 'Roboto');
      case 'content':
        return const TextStyle(
            fontSize: 14, color: Colors.white, fontFamily: 'Roboto');
      case 'helperContent':
        return TextStyle(
            fontSize: 14, color: Colors.grey.shade300, fontFamily: 'Roboto');
      case 'primarySubTitle':
        return const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontFamily: 'Roboto');
      case 'secondaryTitle':
        return const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Billabong');
      case 'secondarySubTitle':
        return const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Roboto');
      case 'secondaryHeading':
        return const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Roboto');
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(label, style: getStyle());
  }
}
