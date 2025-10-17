
import 'package:flutter/material.dart';
import 'package:woodcore_assessment/core/models/loan_model.dart';
import 'package:woodcore_assessment/core/utils/theme/app_colors.dart';

class LoanInfoItem extends StatelessWidget {
  final String title;
  final String value;

  const LoanInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class PaymentInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isLarge;

  const PaymentInfoItem({
    super.key,
    required this.title,
    required this.value,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isLarge ? 18 : 14,
            fontWeight: isLarge ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class LoanCard extends StatelessWidget {
  final LoanModel loan;
  final VoidCallback onPayPressed;
  final bool isProcessingPayment;

  const LoanCard({
    super.key,
    required this.loan,
    required this.onPayPressed,
    this.isProcessingPayment = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoanInfoItem(
                    title: "Loan Amount",
                    value: loan.loanAmount,
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  LoanInfoItem(
                    title: "Contract period",
                    value: loan.contractPeriod,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.lightGray.withOpacity(0.6),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PaymentInfoItem(
                        title: "Total left",
                        value: loan.totalLeft,
                        isLarge: true,
                      ),
                      PaymentInfoItem(
                        title: "Next payment",
                        value: loan.nextPayment,
                        isLarge: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(15),
                    minHeight: 7,
                    value: loan.progress,
                    backgroundColor: Colors.white,
                    color: AppColors.primaryBlue,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: isProcessingPayment ? null : onPayPressed,
              icon: isProcessingPayment
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Icon(Icons.payment),
              label: Text(
                isProcessingPayment ? "Processing..." : "Pay",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}