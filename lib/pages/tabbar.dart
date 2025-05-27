import 'package:expense/core/constants/constants.dart';
import 'package:expense/pages/add_expense.dart';
import 'package:expense/pages/home.dart';
import 'package:expense/pages/profile_screen.dart';
import 'package:expense/pages/statistics.dart';
import 'package:expense/providers/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabbarPage extends ConsumerWidget {
  const TabbarPage({super.key});
  static final List<Widget> pages = [
    HomeScreen(),
    StatisticsScreen(),
    AddExpenseScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomnavProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          useLegacyColorScheme: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Constants.whiteColor,
          fixedColor: Constants.whiteColor,
          currentIndex: currentIndex,
          onTap: (index) => ref.read(bottomnavProvider.notifier).state = index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Color.fromARGB(255, 228, 231, 248),
              ),
              label: '',
              activeIcon: Icon(
                Icons.home_filled,
                color: Constants.lavender,
                size: 32,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart_rounded,
                color: Color.fromARGB(255, 208, 214, 251),
              ),
              label: '',
              activeIcon: Icon(
                Icons.bar_chart_rounded,
                color: Constants.lavender,
                size: 32,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_rounded,
                color: Color.fromARGB(255, 228, 231, 248),
              ),
              label: '',
              activeIcon: Icon(
                Icons.add_circle_rounded,
                color: Constants.lavender,
                size: 32,
              ),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_rounded,
                color: Color.fromARGB(255, 228, 231, 248),
              ),
              label: '',
              activeIcon: Icon(
                Icons.person_rounded,
                color: Constants.lavender,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
