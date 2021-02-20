import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/card_model.dart';
import '../providers/card_one_provider.dart';
import 'card_item.dart';

// This Widget produces the grid of cards for the one card and left card

class CardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final twoCards = Provider.of<CardModel>(context);
    bool isTwoCards = twoCards.twoCards;
    double toolbarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - toolbarHeight) * .39;
    final double itemWidth = size.width * .5;
    final cardData = Provider.of<CardOneProvider>(context);
    final items = cardData.cardItems;

    void _newCard() {
      Provider.of<CardOneProvider>(context, listen: false).addCard();
    }

    double _fontBingo(bool isLandscape, bool twoCards) {
      bool isPhone = MediaQuery.of(context).size.shortestSide < 450;
      // Phone Landscape one card
      if (isPhone && isLandscape && !twoCards) {
        return 25;
        // Phone Landscape two cards
      } else if (isPhone && isLandscape) {
        return 25;
        //Phone in Portrait
      } else if (isPhone && !isLandscape) {
        return 43;
        // Tablet  Landscape one card
      } else if (isLandscape && !twoCards) {
        return 55;
        // Tablet Landscape two cards
      } else if (isLandscape) {
        return 35;
        // Tablet Portrait
      } else if (!isLandscape) {
        return 60;
      } else {
        return 30;
      }
    }

    Widget bingoWidget(letter) {
      return Center(
        child: Container(
          height: _fontBingo(isLandscape, isTwoCards) + 5,
          width: _fontBingo(isLandscape, isTwoCards) + 5,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).secondaryHeaderColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            letter,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: _fontBingo(isLandscape, isTwoCards),
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

    return Container(
      child: items.isEmpty
          ? Center(
              child: RaisedButton.icon(
                padding: EdgeInsets.all(10),
                color: Theme.of(context).primaryColor,
                onPressed: _newCard,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text(
                  'New Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(bingo().toString()),
                    bingoWidget('B'),
                    bingoWidget('I'),
                    bingoWidget('N'),
                    bingoWidget('G'),
                    bingoWidget('O'),
                  ],
                ),
                Expanded(
                  child: GridView.count(
                    shrinkWrap: false,
                    childAspectRatio: isLandscape && twoCards.twoCards
                        ? itemWidth / itemWidth
                        : itemWidth / itemHeight,
                    crossAxisCount: 5,
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                    children: [
                      // Row 1
                      ChangeNotifierProvider.value(
                        value: items[0],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[5],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[10],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[15],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[20],
                        child: CardItem(isTwoCards),
                      ),
                      // // Row 2
                      ChangeNotifierProvider.value(
                        value: items[1],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[6],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[11],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[16],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[21],
                        child: CardItem(isTwoCards),
                      ),
                      // // Row 3
                      ChangeNotifierProvider.value(
                        value: items[2],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[7],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[12],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[17],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[22],
                        child: CardItem(isTwoCards),
                      ),
                      // // Row 4
                      ChangeNotifierProvider.value(
                        value: items[3],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[8],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[13],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[18],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[23],
                        child: CardItem(isTwoCards),
                      ),
                      // // Row 5
                      ChangeNotifierProvider.value(
                        value: items[4],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[9],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[14],
                        child: CardItem(isTwoCards),
                      ),
                      ChangeNotifierProvider.value(
                        value: items[19],
                        child: CardItem(isTwoCards),
                      ),

                      ChangeNotifierProvider.value(
                        value: items[24],
                        child: CardItem(isTwoCards),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
