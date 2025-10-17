import 'package:flutter/material.dart';
import 'package:woodcore_assessment/core/utils/theme/app_colors.dart';
import 'package:woodcore_assessment/features/home/views/home_screen.dart';
import 'package:woodcore_assessment/features/cards/views/cards_screen.dart';
import 'package:woodcore_assessment/features/loans/views/loans_screen.dart';
import 'package:woodcore_assessment/features/transactions/views/transactions_screen.dart';
import 'package:woodcore_assessment/features/support/views/support_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MyHomePage(),
    const CardsScreen(),
    const LoansScreen(),
    const TransactionsScreen(),
    const SupportScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      // bottomNavigationBar: const CustomBottomNavBar(),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top indicator line
            Container(
              height: 3,
              child: Row(
                children: List.generate(5, (index) {
                  return Expanded(
                    child: Container(
                      color: _currentIndex == index
                          ? AppColors.primaryBlue
                          : Colors.transparent,
                    ),
                  );
                }),
              ),
            ),
            // Bottom navigation content
            Container(
              height: 60,
              child: Row(
                children: [
                  _buildNavItem(Icons.home_outlined, Icons.home, 0),
                  _buildNavItem(
                      Icons.credit_card_outlined, Icons.credit_card, 1),
                  _buildNavItem(
                      Icons.account_balance_outlined, Icons.account_balance, 2),
                  _buildNavItem(Icons.pie_chart, Icons.pie_chart, 3),
                  _buildNavItem(
                      Icons.messenger_outline, Icons.messenger_outline, 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData unselectedIcon, IconData selectedIcon, int index) {
    final isSelected = _currentIndex == index;
    bool isCenter = index == 2;
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabTapped(index),
        child: Container(
          height: 60,
          color: Colors.transparent,
          child: Center(
            child: isCenter
                ? Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.red,
                      border: Border.all(color: AppColors.lightGray, width: 1),
                    ),
                    child: Icon(
                      isSelected ? selectedIcon : unselectedIcon,
                      color: AppColors
                          .primaryBlue, // Always active color for center
                      size: 24,
                    ),
                  )
                : Icon(
                    isSelected ? selectedIcon : unselectedIcon,
                    color: isSelected ? AppColors.primaryBlue : Colors.grey,
                    size: 24,
                  ),
          ),
        ),
      ),
    );
  }
}
