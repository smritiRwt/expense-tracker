import 'package:expense/core/constants/constants.dart';
import 'package:expense/pages/add_expense_form.dart';
import 'package:expense/pages/add_income.dart';
import 'package:expense/pages/components/add_card.dart';
import 'package:expense/pages/components/last_expense.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                Row(
                  children: [
                    Icon(Icons.add_circle_rounded, color: Constants.lavender),
                    const SizedBox(width: 5),
                    Text(
                      "Add",
                      style: Theme.of(
                        context,
                      ).textTheme.displayMedium?.copyWith(
                        color: Constants.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AddCustomCard(
                      icon: Icons.monetization_on_outlined,
                      text: "Add Expense",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTransactionScreen(),
                          ),
                        );
                      },
                      iconColor: Constants.lavender,
                      backgroundColor: Colors.purple[900]?.withAlpha(15),
                    ),

                    AddCustomCard(
                      icon: Icons.wallet_outlined,
                      text: "Add Income",
                      backgroundColor: Colors.amber.withAlpha(15),
                      iconColor: Colors.amber[500],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddIncomeScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "Last Added",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return LastExpenseCard(
                      icon: Icons.monetization_on_outlined,
                      text: "title",
                      iconColor: Constants.lavender,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
