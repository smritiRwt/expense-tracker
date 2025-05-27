import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String label;
  final String initialValue;

  const RoundedTextField({
    super.key,
    required this.label,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(initialValue, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
