import 'package:flutter/foundation.dart';
import 'package:woodcore_assessment/core/models/loan_model.dart';

class LoansViewModel extends ChangeNotifier {


  //i could put all these in a state instead too.
  List<LoanModel> _loans = [];
  bool _isExpanded = true;
  bool _isLoading = false;
  bool _isProcessingPayment = false;

  // Getters
  List<LoanModel> get loans => _loans;
  bool get isExpanded => _isExpanded;
  bool get isLoading => _isLoading;
  bool get isProcessingPayment => _isProcessingPayment;
  bool get hasLoans => _loans.isNotEmpty;
  LoanModel? get activeLoan => _loans.isNotEmpty ? _loans.first : null;

  LoansViewModel() {
    _loadMockData();
  }

  // Toggle expansion state
  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  // Load mock data
  void _loadMockData() {
    _isLoading = true;
    notifyListeners();

    // Simulating API call delay
    Future.delayed(const Duration(milliseconds: 800), () {
      _loans = [
        LoanModel(
          id: '1',
          loanAmount: '\$20,500',
          contractPeriod: '360 days',
          totalLeft: '\$20,500',
          nextPayment: '4 May 2023',
          progress: 0.5,
        ),
      ];
      _isLoading = false;
      notifyListeners();
    });
  }

  // Make payment
  Future<void> makePayment(String loanId, double amount) async {
    _isProcessingPayment = true;
    notifyListeners();

    try {
      // Simulate payment processing
      await Future.delayed(const Duration(seconds: 2));

      final loanIndex = _loans.indexWhere((loan) => loan.id == loanId);
      if (loanIndex != -1) {
        final currentLoan = _loans[loanIndex];

        // Calculate new values after payment
        String currentTotalLeft =
            currentLoan.totalLeft.replaceAll('\$', '').replaceAll(',', '');
        double currentAmount = double.tryParse(currentTotalLeft) ?? 0.0;
        double newAmount = currentAmount - amount;

        // Update progress (assuming original loan was $20,500)
        double originalAmount = 20500.0;
        double newProgress = (originalAmount - newAmount) / originalAmount;

        // Update the loan
        _loans[loanIndex] = currentLoan.copyWith(
          totalLeft: '\$${newAmount.toStringAsFixed(0)}',
          progress: newProgress.clamp(0.0, 1.0),
        );

        debugPrint(
            'Payment of \$${amount.toStringAsFixed(2)} processed successfully');
      }
    } catch (e) {
      debugPrint('Payment failed: $e');
    } finally {
      _isProcessingPayment = false;
      notifyListeners();
    }
  }





  // Handle create new loan action
  void onCreateNewLoan() {
    
    debugPrint('Create new loan tapped');

  }

  // Handle pay button action
  void onPayButtonPressed() {
    if (activeLoan != null) {
      // For demo purposes, make a payment of $500
      makePayment(activeLoan!.id, 500.0);
    }
  }
}
