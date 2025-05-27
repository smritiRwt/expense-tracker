import 'package:expense/core/constants/constants.dart';
import 'package:expense/pages/components/action_buttons.dart';
import 'package:expense/pages/components/category_dropdown.dart';
import 'package:expense/pages/components/payment_type_selector.dart';
import 'package:expense/pages/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  String selectedCategory = 'Food';
  String selectedPaymentType = 'Cash';

  void _handleAdd() {
    // Handle Add logic
  }

  void _handleDraft() {
    // Handle Save as Draft logic
  }
  final List<String> categoryOptions = [
    'Food',
    'Home',
    'Bill',
    'Shopping',
    'Transport',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Constants.blackColor),
          ),
          title: Text(
            'Add transaction',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const RoundedTextField(label: 'Amount', initialValue: '\$12.00'),
              const SizedBox(height: 20),
              CategoryDropdown(
                selectedCategory: selectedCategory,
                categories: categoryOptions,
                onChanged: (newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              PaymentTypeSelector(
                selectedType: selectedPaymentType,
                onChanged: (val) {
                  setState(() => selectedPaymentType = val);
                },
              ),
              const SizedBox(height: 30),
              ActionButtons(onAdd: _handleAdd),
            ],
          ),
        ),
      ),
    );
  }
}
