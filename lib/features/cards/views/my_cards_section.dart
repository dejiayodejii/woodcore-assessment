import 'package:flutter/material.dart';
import 'package:woodcore_assessment/core/models/card_model.dart';
import 'package:woodcore_assessment/core/utils/theme/app_colors.dart';
import 'package:woodcore_assessment/features/cards/viewmodels/cards_viewmodel.dart';

class CardItem extends StatelessWidget {
  final CardModel card;

  const CardItem({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.03),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    card.icon,
                    scale: 2,
                    height: 30,
                    width: 30,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.cardType,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      card.cardNumber,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              card.amount,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyCardsSection extends StatefulWidget {
  const MyCardsSection({super.key});

  @override
  State<MyCardsSection> createState() => _MyCardsSectionState();
}

class _MyCardsSectionState extends State<MyCardsSection> {
  late CardsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CardsViewModel();
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
                        "My cards",
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
                  onTap: _viewModel.onCreateNewCard,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        size: 13,
                        color: AppColors.primaryBlue,
                      ),
                      Text(
                        "Create new card",
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
              else if (_viewModel.hasCards)
                Card(
                  color: Colors.white,
                  elevation: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: _buildCardItems(),
                    ),
                  ),
                )
              else
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'No cards available',
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

  List<Widget> _buildCardItems() {
    List<Widget> items = [];
    for (int i = 0; i < _viewModel.cards.length; i++) {
      items.add(CardItem(card: _viewModel.cards[i]));

      // Add divider between cards (not after the last one)
      if (i < _viewModel.cards.length - 1) {
        items.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(color: Colors.grey.withOpacity(0.3)),
          ),
        );
      }
    }
    return items;
  }
}
