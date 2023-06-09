import 'package:flutter/material.dart';
import 'package:social_media_app/components/piece.dart';
import 'package:social_media_app/components/square.dart';
import 'package:social_media_app/helper/helper_methods.dart';
import 'package:social_media_app/styles/styles.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late List<List<ChessPiece?>> board;
  ChessPiece? selectedPiece;
  int selectedRow = -1;
  int selectedCol = -1;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));
    for (int i = 0; i < 8; i++) {
      //pawns
      newBoard[1][i] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.pawn,
          imagePath: 'assets/images/pawn.png');
      newBoard[6][i] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.pawn,
          imagePath: 'assets/images/pawn.png');

      // rooks
      newBoard[0][0] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.rook,
          imagePath: 'assets/images/rook.png');
      newBoard[0][7] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.rook,
          imagePath: 'assets/images/rook.png');
      newBoard[7][0] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.rook,
          imagePath: 'assets/images/rook.png');
      newBoard[7][7] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.rook,
          imagePath: 'assets/images/rook.png');
      //bishops
      newBoard[0][2] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.bishop,
          imagePath: 'assets/images/bishop.png');
      newBoard[0][5] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.bishop,
          imagePath: 'assets/images/bishop.png');
      newBoard[7][2] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.bishop,
          imagePath: 'assets/images/bishop.png');
      newBoard[7][5] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.bishop,
          imagePath: 'assets/images/bishop.png');
      //king
      newBoard[0][4] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.king,
          imagePath: 'assets/images/king.png');
      newBoard[7][4] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.king,
          imagePath: 'assets/images/king.png');
      //queen
      newBoard[0][3] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.queen,
          imagePath: 'assets/images/queen.png');
      newBoard[7][3] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.queen,
          imagePath: 'assets/images/queen.png');
      //knight
      newBoard[0][1] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.knight,
          imagePath: 'assets/images/knight.png');
      newBoard[7][1] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.knight,
          imagePath: 'assets/images/knight.png');
      newBoard[0][6] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.knight,
          imagePath: 'assets/images/knight.png');
      newBoard[7][6] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.knight,
          imagePath: 'assets/images/knight.png');
    }
    board = newBoard;
  }

  void pieceSelected(int row, int col) {
    setState(() {
      selectedPiece = board[row][col];
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GridView.builder(
        itemCount: 8 * 8,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) {
          int row = index ~/ 8;
          int col = index % 8;
          bool isSelected = selectedRow == row && selectedCol == col;
          return Square(
            isWhite: isWhite(index),
            piece: board[row][col],
            isSelected: isSelected,
            onTap: () => pieceSelected(row, col),
          );
        },
      ),
    );
  }
}
