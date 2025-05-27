import 'package:expense/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PaymentTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onChanged;

  const PaymentTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final types = ['Cash', 'Credit/Debit Card', 'Check'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Payment Type'),
        const SizedBox(height: 6),
        Column(
          children:
              types.map((type) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () => onChanged(type),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              selectedType == type
                                  ? Constants.lavender
                                  : Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: type,
                            groupValue: selectedType,
                            onChanged: (val) => onChanged(val!),
                            activeColor: Constants.lavender,
                          ),
                          Text(type),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
