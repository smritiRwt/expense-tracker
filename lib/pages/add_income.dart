import 'package:expense/core/constants/constants.dart';
import 'package:expense/pages/components/action_buttons.dart';
import 'package:expense/pages/components/category_dropdown.dart';
import 'package:expense/pages/components/payment_type_selector.dart';
import 'package:expense/pages/components/rounded_text_field.dart';
import 'package:flutter/material.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  String selectedCategory = 'Salary';
  String selectedPaymentType = 'Cash';
  final List<String> incomeCategories = [
    'Salary',
    'Freelancing',
    'Gift',
    'Bonus',
    'Investment',
  ];

  void _handleAddIncome() {
    // Implement saving logic here
    debugPrint('Income Added: $selectedCategory, $selectedPaymentType');
  }

  void _handleDraftIncome() {
    // Implement draft save logic
    debugPrint('Income Drafted');
  }

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
            'Add Income',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const RoundedTextField(label: 'Amount', initialValue: '\$0.00'),
              const SizedBox(height: 20),
              CategoryDropdown(
                selectedCategory: selectedCategory,
                categories: incomeCategories,
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
              ActionButtons(
                onDraft: _handleDraftIncome,
                onAdd: _handleAddIncome,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
