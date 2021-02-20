import 'package:flutter/material.dart';
import '../models/card_model.dart';

// This provider provides the state for the one card and left card

class CardOneProvider with ChangeNotifier {
  List<CardModel> _cardItems = [];

  List<CardModel> get cardItems {
    return [..._cardItems];
  }

  void addCard() {
    List value = createData();
    final List<CardModel> loadedCard = [];
    for (var i = 0; i < value.length; i++) {
      loadedCard.add(CardModel(
        id: i,
        number: value[i],
        isSelected: false,
      ));
    }
    _cardItems = loadedCard;
    notifyListeners();
  }

  List randomList(start, end) {
    List possible = [];
    for (int i = start; i < end + 1; i++) {
      possible.add(i);
    }
    possible.shuffle();
    var number = possible.sublist(1, 6);
    return number;
  }

  List createData() {
    List bingo = [];
    bingo.add(randomList(1, 15));
    bingo.add(randomList(16, 30));
    bingo.add(randomList(31, 45));
    bingo.add(randomList(46, 60));
    bingo.add(randomList(61, 75));
    var oneList = [];
    bingo.forEach((e) => oneList.addAll(e));
    return oneList;
  }
}
