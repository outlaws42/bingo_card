import 'package:bingo_test/widgets/main_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/card_one_provider.dart';
import '../providers/card_two_provider.dart';
import '../models/card_model.dart';
import '../widgets/main_body.dart';

// This is the Screen with the toolbar. It decides what is displayed in the
// body of the screen. It calls 2 different grid widgets.

enum FilterOptions {
  Card1,
  Card2,
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _savedCardItem(String type) {
    if (type == 'CardOneProvider') {
      Provider.of<CardOneProvider>(context, listen: false).addCard();
    } else {
      Provider.of<CardTwoProvider>(context, listen: false).addCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    final twoCards = Provider.of<CardModel>(context);
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bingo Card'),
        actions: <Widget>[
          isLandscape
              ? FlatButton.icon(
                  icon: !twoCards.twoCards
                      ? Icon(
                          Icons.chrome_reader_mode_outlined,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.image_aspect_ratio_rounded,
                          color: Colors.white,
                        ),
                  label: twoCards.twoCards
                      ? Text(
                          'One Card',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Two Cards',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                  onPressed: () => twoCards.toggleTwoCards(),
                )
              : Text(' '),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Card1) {
                _savedCardItem("CardOneProvider");
              } else {
                _savedCardItem("CardTwoProvider");
              }
              print(selectedValue);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: (isLandscape && twoCards.twoCards)
                    ? Text('New Left Card')
                    : Text('New Card'),
                value: FilterOptions.Card1,
              ),
              (isLandscape && twoCards.twoCards)
                  ? PopupMenuItem(
                      child: Text('New Right Card'),
                      value: FilterOptions.Card2,
                    )
                  : null,
            ],
          )
        ],
      ),
      body: MainBody(),
    );
  }
}
