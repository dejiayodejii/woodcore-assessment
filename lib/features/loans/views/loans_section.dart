import 'package:flutter/material.dart';
import 'package:woodcore_assessment/core/models/loan_model.dart';
import 'package:woodcore_assessment/core/utils/theme/app_colors.dart';
import 'package:woodcore_assessment/features/loans/viewmodels/loans_viewmodel.dart';
import 'package:woodcore_assessment/features/loans/widget/loan_widgets.dart';


class LoansSection extends StatefulWidget {
  const LoansSection({super.key});

  @override
  State<LoansSection> createState() => _LoansSectionState();
}

class _LoansSectionState extends State<LoansSection> {
  late LoansViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LoansViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _viewModel.toggleExpansion,
                  child: Row(
                    children: [
                      const Text(
                        "Loans",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        _viewModel.isExpanded
                            ? Icons.keyboard_arrow_down_outlined
                            : Icons.keyboard_arrow_right_outlined,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _viewModel.onCreateNewLoan,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 13,
                        color: AppColors.primaryBlue,
                      ),
                      Text(
                        "Create new loan",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryBlue.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_viewModel.isExpanded) ...[
              const SizedBox(height: 15),
              if (_viewModel.isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (_viewModel.hasLoans && _viewModel.activeLoan != null)
                LoanCard(
                  loan: _viewModel.activeLoan!,
                  onPayPressed: _viewModel.onPayButtonPressed,
                  isProcessingPayment: _viewModel.isProcessingPayment,
                )
              else
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'No loans available',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
            ],
          ],
        );
      },
    );
  }
}
