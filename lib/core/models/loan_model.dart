class LoanModel {
  final String id;
  final String loanAmount;
  final String contractPeriod;
  final String totalLeft;
  final String nextPayment;
  final double progress; // 0.0 to 1.0
  final bool isActive;

  LoanModel({
    required this.id,
    required this.loanAmount,
    required this.contractPeriod,
    required this.totalLeft,
    required this.nextPayment,
    required this.progress,
    this.isActive = true,
  });

  LoanModel copyWith({
    String? id,
    String? loanAmount,
    String? contractPeriod,
    String? totalLeft,
    String? nextPayment,
    double? progress,
    bool? isActive,
  }) {
    return LoanModel(
      id: id ?? this.id,
      loanAmount: loanAmount ?? this.loanAmount,
      contractPeriod: contractPeriod ?? this.contractPeriod,
      totalLeft: totalLeft ?? this.totalLeft,
      nextPayment: nextPayment ?? this.nextPayment,
      progress: progress ?? this.progress,
      isActive: isActive ?? this.isActive,
    );
  }
}
