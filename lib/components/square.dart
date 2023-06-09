import 'package:flutter/material.dart';
import 'package:social_media_app/components/piece.dart';
import 'package:social_media_app/styles/styles.dart';

class Square extends StatelessWidget {
  final ChessPiece? piece;
  final bool isWhite;
  const Square({
    super.key,
    required this.piece,
    required this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isWhite ? foregroundColor : backgroundColor,
      child: piece != null
          ? Image.asset(
              piece!.imagePath,
              color: piece!.isWhite ? Colors.white : Colors.black,
            )
          : null,
    );
  }
}
