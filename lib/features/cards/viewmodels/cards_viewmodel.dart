import 'package:flutter/foundation.dart';
import 'package:woodcore_assessment/core/models/card_model.dart';
import 'package:woodcore_assessment/core/utils/theme/app_images.dart';

class CardsViewModel extends ChangeNotifier {
  List<CardModel> _cards = [];
  bool _isExpanded = true;
  bool _isLoading = false;

  // Getters
  List<CardModel> get cards => _cards;
  bool get isExpanded => _isExpanded;
  bool get isLoading => _isLoading;
  bool get hasCards => _cards.isNotEmpty;


  CardsViewModel() {
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

    // Simulate API call delay
    Future.delayed(const Duration(milliseconds: 500), () {
      _cards = [
        CardModel(
          id: '1',
          cardType: 'Mastercard',
          cardNumber: '**** 6098',
          amount: '\$1,9890.60',
          icon: AppImages.mastercard,
        ),
        CardModel(
          id: '2',
          cardType: 'Visa card',
          cardNumber: '**** 6098',
          amount: '\$1,690.20',
          icon: AppImages.visa,
        ),
      ];
      _isLoading = false;
      notifyListeners();
    });
  }

  // Add new card
  void addCard(CardModel card) {
  }

  // Remove card
  void removeCard(String cardId) {

  }



  Future<void> refreshCards() async {
    _loadMockData();
  }


  void onCreateNewCard() {
    debugPrint('Create new card tapped');
  }
}
