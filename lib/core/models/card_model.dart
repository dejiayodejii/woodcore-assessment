class CardModel {
  final String id;
  final String cardType;
  final String cardNumber;
  final String amount;
  final String icon;
  final bool isActive;

  CardModel({
    required this.id,
    required this.cardType,
    required this.cardNumber,
    required this.amount,
    required this.icon,
    this.isActive = true,
  });

  CardModel copyWith({
    String? id,
    String? cardType,
    String? cardNumber,
    String? amount,
    String? icon,
    bool? isActive,
  }) {
    return CardModel(
      id: id ?? this.id,
      cardType: cardType ?? this.cardType,
      cardNumber: cardNumber ?? this.cardNumber,
      amount: amount ?? this.amount,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
    );
  }
}
