import 'package:bingo_test/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/card_one_provider.dart';
import 'providers/card_two_provider.dart';
import './models/card_model.dart';
import 'screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CardOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CardTwoProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CardModel(
            id: 0,
            number: 1,
            isSelected: false,
            twoCards: false,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Bingo Card',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.deepOrange,
          cardColor: Colors.grey[300],
          fontFamily: 'Lato',
        ),
        home: MainScreen(),
      ),
    );
  }
}
