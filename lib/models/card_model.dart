import 'package:flutter/foundation.dart';

// This Model is the layout of each individual item in the state.

class CardModel with ChangeNotifier {
  final int id;
  final int number;
  bool isSelected = false;
  bool twoCards = false;

  CardModel({
    @required this.id,
    @required this.number,
    this.isSelected,
    this.twoCards,
  });

  void toggleItemStatus() {
    isSelected = !isSelected;
    notifyListeners();
  }

  void toggleTwoCards() {
    twoCards = !twoCards;
    notifyListeners();
  }
}
