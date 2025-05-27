import 'package:expense/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final List<double> weeklyExpenses = [640, 850, 622, 960, 732];
  final double weeklyLimit = 900;

  final List<Map<String, dynamic>> categories = [
    {
      'label': 'Shop',
      'color': const Color.fromARGB(255, 96, 113, 211),
      'value': -1190,
      'icon': Icons.shopping_bag,
    },
    {
      'label': 'Transport',
      'color': const Color.fromARGB(255, 40, 37, 37),
      'value': -867,
      'icon': Icons.directions_car,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.bar_chart_rounded, color: Constants.lavender),
                    const SizedBox(width: 5),
                    Text(
                      "Statistics",
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
                const SizedBox(height: 20),

                // Total Expense Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Constants.lavender,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Expense",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Constants.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "\$",
                              style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 23,
                              ),
                            ),
                            TextSpan(
                              text: "3,322",
                              style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: " / \$4000 per month",
                              style: TextStyle(
                                color: Constants.whiteColor.withOpacity(0.7),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        backgroundColor: Constants.whiteColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        color: Constants.whiteColor,
                        value: 0.83,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Expense Breakdown Section
                _buildExpenseBreakdown(),

                const SizedBox(height: 20),

                // Spending Details Section
                _buildSpendingDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpenseBreakdown() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 201, 191, 237).withAlpha(50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Expense Breakdown",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Constants.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Constants.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Text("Monthly", style: TextStyle(fontSize: 12)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Limit \$900 / week",
            style: TextStyle(fontSize: 12, color: Constants.gray),
          ),
          const SizedBox(height: 16),

          // Bar Chart With Y-Axis Labels
          SizedBox(
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Y-Axis Labels
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (i) {
                    final label = 1200 - i * 200;
                    return SizedBox(
                      height: 24,
                      width: 40,
                      child: Text(
                        '\$$label',
                        style: TextStyle(
                          fontSize: 10,
                          color: Constants.blackColor.withOpacity(0.7),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(width: 8),

                // Bars
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(weeklyExpenses.length, (index) {
                      final value = weeklyExpenses[index];
                      final isExceeded = value > weeklyLimit;
                      final barColor =
                          isExceeded
                              ? const Color.fromARGB(
                                255,
                                233,
                                138,
                                138,
                              ) // Light Red
                              : const Color.fromARGB(
                                255,
                                145,
                                218,
                                242,
                              ); // Light Sky
                      final fillRatio = value / 1200;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Value on top
                          Text(
                            '\$${value.toInt()}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Constants.blackColor,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 120,
                            width: 26,
                            decoration: BoxDecoration(
                              color: Constants.gray.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            alignment: Alignment.bottomCenter,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: (130 * fillRatio.clamp(0.0, 1.0)),
                              width: 26,
                              decoration: BoxDecoration(
                                color: barColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Text(
                            'W${index + 1}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Constants.blackColor,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Spending Details",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Constants.blackColor),
        ),
        Text(
          "Your expenses are divided into 6 categories",
          style: TextStyle(fontSize: 12, color: Constants.gray),
        ),
        const SizedBox(height: 12),

        // Legend Bar
        Row(
          children: const [
            _LegendBarSegment(percentage: 40, color: Colors.indigo),
            _LegendBarSegment(percentage: 25, color: Colors.teal),
            _LegendBarSegment(percentage: 15, color: Colors.purple),
            _LegendBarSegment(percentage: 10, color: Colors.orange),
            _LegendBarSegment(percentage: 5, color: Colors.green),
            _LegendBarSegment(percentage: 5, color: Colors.blueGrey),
          ],
        ),
        const SizedBox(height: 20),

        // Category Cards with icons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              categories.map((cat) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Constants.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Constants.gray.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: cat['color'].withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(cat['icon'], color: cat['color'], size: 20),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cat['label'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Constants.blackColor,
                            ),
                          ),
                          Text(
                            "\$${cat['value'].abs()}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: cat['color'],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

class _LegendBarSegment extends StatelessWidget {
  final double percentage;
  final Color color;

  const _LegendBarSegment({
    required this.percentage,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: percentage.toInt(),
      child: Container(height: 8, color: color),
    );
  }
}
