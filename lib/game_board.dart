import 'package:flutter/material.dart';
import 'package:social_media_app/components/square.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 8 * 8,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) {
          int x = index ~/ 8;
          int y = index % 8;
          bool isWhite = (x + y) % 2 == 0;
          return Square(isWhite: isWhite);
        },
      ),
    );
  }
}
