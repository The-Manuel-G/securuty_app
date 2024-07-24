import 'package:flutter/material.dart';
import 'dart:math';

class CardGameScreen extends StatefulWidget {
  @override
  _CardGameScreenState createState() => _CardGameScreenState();
}

class _CardGameScreenState extends State<CardGameScreen> {
  final List<String> cardImages = [
    'assets/cards/ace_of_spades.png',
    'assets/cards/king_of_hearts.png',
    // Agrega más cartas aquí
  ];

  String? displayedCard;

  void drawCard() {
    final random = Random();
    setState(() {
      displayedCard = cardImages[random.nextInt(cardImages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (displayedCard != null)
              Image.asset(displayedCard!)
            else
              Text(
                'Draw a card!',
                style: TextStyle(fontSize: 24),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: drawCard,
              child: Text('Draw Card'),
            ),
          ],
        ),
      ),
    );
  }
}
