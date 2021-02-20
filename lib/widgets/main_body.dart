import 'package:bingo_test/widgets/card_one.dart';
import 'package:bingo_test/widgets/card_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/card_model.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double toolbarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;
    final twoCards = Provider.of<CardModel>(context);
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double ratio = MediaQuery.of(context).devicePixelRatio;
    var size = MediaQuery.of(context).size;
    //.53 Apple tablets .5 stylo .52 Android tab 10" .5 Anroid tab 7"
    final double width = (size.width - toolbarHeight) * .5;
    final double height = (size.height - toolbarHeight) / ratio;

    return (isLandscape && twoCards.twoCards)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: height < 135 ? 278 : width,
                //height: height,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 8,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  child: CardOne(),
                ),
              ),
              SizedBox(
                width: height < 135 ? 278 : width,
                //height: height,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 8,
                        color: Colors.white, // Right border invisible spacing
                      ),
                    ),
                  ),
                  child: CardTwo(),
                ),
              ),
            ],
          )
        : CardOne();
  }
}
