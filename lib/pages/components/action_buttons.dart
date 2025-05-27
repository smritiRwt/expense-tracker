import 'package:expense/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback? onDraft;
  final VoidCallback onAdd;

  const ActionButtons({super.key, this.onDraft, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: OutlinedButton(onPressed: onDraft, child: const Text('Draft')),
        // ),
        // const SizedBox(widtsh: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: onAdd,
            style: ElevatedButton.styleFrom(
              backgroundColor: Constants.lavender,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Add',
              style: TextStyle(color: Constants.whiteColor),
            ),
          ),
        ),
      ],
    );
  }
}
