import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/card_model.dart';

// This Widget produces the individual numbered buttons.

class CardItem extends StatelessWidget {
  final bool twoCards;
  CardItem(this.twoCards);
  @override
  Widget build(BuildContext context) {
    double _fontSize(bool isLandscape) {
      bool isPhone = MediaQuery.of(context).size.shortestSide < 450;
      // Phone Landscape one card
      if (isPhone && isLandscape && !twoCards) {
        return 33;
        // Phone Landscape two cards
      } else if (isPhone && isLandscape) {
        return 30;
        //Phone in Portrait
      } else if (isPhone && !isLandscape) {
        return 43;
        // Tablet  Landscape one card
      } else if (isLandscape && !twoCards) {
        return 65;
        // Tablet Landscape two cards
      } else if (isLandscape) {
        return 50;
        // Tablet Portrait
      } else if (!isLandscape) {
        return 70;
      } else {
        return 30;
      }
    }

    final item = Provider.of<CardModel>(context);
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Card(
      elevation: item.isSelected || item.id == 12 ? 0 : 3,
      color: item.isSelected || item.id == 12
          ? Theme.of(context).primaryColor
          : Theme.of(context).cardColor,
      child: InkWell(
        onTap: () => item.toggleItemStatus(),
        child: Align(
          alignment: Alignment.center,
          child: item.id != 12
              ? Text(
                  item.number.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _fontSize(isLandscape),
                    color: item.isSelected
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                )
              : Icon(
                  Icons.star,
                  size: _fontSize(isLandscape),
                  color: item.isSelected || item.id == 12
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
        ),
      ),
    );
  }
}
