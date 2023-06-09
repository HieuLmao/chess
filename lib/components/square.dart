import 'package:flutter/material.dart';
import 'package:social_media_app/components/piece.dart';
import 'package:social_media_app/styles/styles.dart';

class Square extends StatelessWidget {
  final ChessPiece? piece;
  final bool isWhite;
  final bool isSelected;
  final void Function()? onTap;
  const Square({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.piece,
    required this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;
    if (isSelected) {
      squareColor = Colors.green;
    } else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
