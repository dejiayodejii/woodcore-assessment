import 'package:flutter/material.dart';
import 'package:woodcore_assessment/core/utils/theme/app_colors.dart';
import 'package:woodcore_assessment/features/home/widgets/action_buttons.dart';
import 'package:woodcore_assessment/features/home/widgets/custom_app_bar.dart';
import 'package:woodcore_assessment/features/loans/views/loans_section.dart';
import 'package:woodcore_assessment/features/cards/views/my_cards_section.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        userName: "John",
        subtitle: "Your card is ready",
      ),
      backgroundColor: AppColors.primaryBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ActionButtonsRow(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  MyCardsSection(),
                  SizedBox(height: 15),
                  LoansSection(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
