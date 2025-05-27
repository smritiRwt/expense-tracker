import 'package:expense/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../providers/task_provider.dart';
import '../core/constants/app_theme.dart';
// import 'add_task_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final tasks = ref.watch(taskProvider);
    final isDarkMode = ref.watch(themeModeProvider);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(Constants.logoimage, height: 50, width: 35),
                    const SizedBox(width: 10),
                    Text(
                      Constants.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Constants.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.search, size: 25),
                      onPressed: () {
                        ref.read(themeModeProvider.notifier).state =
                            !isDarkMode;
                      },
                    ),
                    // IconButton(
                    //   icon: Icon(
                    //     isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    //   ),
                    //   onPressed: () {
                    //     ref.read(themeModeProvider.notifier).state =
                    //         !isDarkMode;
                    //   },
                    // ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(
                          255,
                          239,
                          210,
                          244,
                        ),
                        radius: 30,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Morning",
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color: Constants.gray,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "John Doe",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color: Constants.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                          elevation: WidgetStateProperty.all(0.5),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "This month",
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                color: Constants.blackColor,
                                fontSize: 12,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Constants.blackColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Constants.blackColor.withAlpha(20),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expense total",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              color: Constants.gray,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "\$3,322",
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(color: Constants.blackColor),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(Constants.logoimage, height: 50, width: 70),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Expense List",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),

                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: groupedExpenses.length,
                    itemBuilder: (context, index) {
                      final group = groupedExpenses[index];
                      return Card(
                        color: Constants.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Date Header
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    group.date,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    group.totalAmount,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Expense Items
                              ...group.expenses.map(
                                (expense) => ExpenseCard(expense: expense),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Expense {
  final String category;
  final String subtitle;
  final String amount;
  final IconData icon;
  final Color iconColor;

  Expense({
    required this.category,
    required this.subtitle,
    required this.amount,
    required this.icon,
    required this.iconColor,
  });
}

class ExpenseGroup {
  final String date;
  final String totalAmount;
  final List<Expense> expenses;

  ExpenseGroup({
    required this.date,
    required this.totalAmount,
    required this.expenses,
  });
}

final List<ExpenseGroup> groupedExpenses = [
  ExpenseGroup(
    date: "Tuesday, 14",
    totalAmount: "-\$1380",
    expenses: [
      Expense(
        category: "Shop",
        subtitle: "Buy new clothes",
        amount: "-\$90",
        icon: Icons.shopping_cart_outlined,
        iconColor: const Color(0xFFDDE3FF),
      ),
      Expense(
        category: "Electronic",
        subtitle: "Buy new iPhone 14",
        amount: "-\$1290",
        icon: Icons.phone_iphone,
        iconColor: const Color(0xFFFFECD4),
      ),
    ],
  ),
  ExpenseGroup(
    date: "Monday, 13",
    totalAmount: "-\$60",
    expenses: [
      Expense(
        category: "Transportation",
        subtitle: "Trip to Malang",
        amount: "-\$60",
        icon: Icons.directions_car,
        iconColor: const Color(0xFFFFD6D6),
      ),
      Expense(
        category: "Shop",
        subtitle: "Buy Books",
        amount: "-\$80",
        icon: Icons.book,
        iconColor: const Color(0xFFFFD6D6),
      ),
    ],
  ),
];

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Constants.whiteColor,
      elevation: 0.2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: expense.iconColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(expense.icon, color: Colors.black),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.category,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    expense.subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              expense.amount,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
