enum ChessPieceType { pawn, bishop, knight, queen, king, rook }

class ChessPiece {
  final ChessPieceType type;
  final String imagePath;
  final bool isWhite;
  ChessPiece({
    required this.isWhite,
    required this.type,
    required this.imagePath,
  });
}
