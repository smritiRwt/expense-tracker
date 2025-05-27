import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Category'),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedCategory,
            icon: const Icon(Icons.arrow_drop_down),
            decoration: const InputDecoration(border: InputBorder.none),
            items:
                categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Icon(_getIconForCategory(value), color: Colors.orange),
                        const SizedBox(width: 10),
                        Text(
                          value,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Food':
        return Icons.fastfood;
      case 'Home':
        return Icons.home;
      case 'Bill':
        return Icons.receipt_long;
      case 'Shopping':
        return Icons.shopping_bag;
      case 'Transport':
        return Icons.directions_car;
      default:
        return Icons.category;
    }
  }
}
