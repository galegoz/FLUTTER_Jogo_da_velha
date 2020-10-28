import 'dart:math';

import 'package:jogo_velha/core/constants.dart';
import 'package:jogo_velha/enums/player_type.dart';
import 'package:jogo_velha/enums/winner_type.dart';
import 'package:jogo_velha/models/board_tile.dart';

class GameController{
  List<BoardTile> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  PlayerType currentPlayer;
  bool isSinglePlayer;

  bool get hasMoves => (movesPlayer1.length + movesPlayer1.length) != BOARD_SIZE;

  GameController(){
    _initialize();
  }

  void _initialize(){
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = PlayerType.player1;
    isSinglePlayer = false;
    tiles = List<BoardTile>.generate(BOARD_SIZE, (index) => BoardTile(index + 1));
  }

  void reset(){
    _initialize();
  }

  void markBoardTileByIndex(index){
    final tile = tiles[index];
    if(currentPlayer == PlayerType.player1){
      _markBoardTileWithPlayer1(tile);
    }else{
      _markBoardTileWithPlayer2(tile);
    }
      tile.enable = false;
    }
  

  void _markBoardTileWithPlayer1(BoardTile tile){
    tile.symbol = PLAYER1_SYMBOL;
    tile.color = PLAYER1;
    movesPlayer1.add(tile.id);
    currentPlayer = PlayerType.player2;
  }

  void _markBoardTileWithPlayer2(BoardTile tile){
    tile.symbol = PLAYER1_SYMBOL;
    tile.color = PLAYER1;
    movesPlayer2.add(tile.id);
    currentPlayer = PlayerType.player1;
  }

  bool _checkPlayerWinner(List<int> moves){
    //verificando as linhas
    if (moves.contains(1) && moves.contains(2) && moves.contains(3)){
      return true;
    }
    if (moves.contains(4) && moves.contains(5) && moves.contains(6)){
      return true;
    }
    if (moves.contains(7) && moves.contains(8) && moves.contains(9)){
      return true;
    }
    //verificando as colunas
    if (moves.contains(1) && moves.contains(4) && moves.contains(7)){
      return true;
    }
    if (moves.contains(2) && moves.contains(5) && moves.contains(8)){
      return true;
    }
    if (moves.contains(3) && moves.contains(6) && moves.contains(9)){
      return true;
    }
    //verificando diagonais
    if (moves.contains(1) && moves.contains(5) && moves.contains(9)){
      return true;
    }
    if (moves.contains(3) && moves.contains(5) && moves.contains(7)){
      return true;
    }
    else{
      return false;
    }
  }

  //Verificar vencedor
  WinnerType checkWinner(){
    if(_checkPlayerWinner(movesPlayer1)) return WinnerType.player1;
    if(_checkPlayerWinner(movesPlayer2)) return WinnerType.player2;
    return WinnerType.none;
  }

  //Movimento aleatório do bot
  int movimentoAutomatico(){
  var list = new List.generate(9, (i) => i + 1);
  list.removeWhere((element) => movesPlayer1.contains(element));
  list.removeWhere((element) => movesPlayer2.contains(element));

  var random = new Random();
  var index = random.nextInt(list.length - 1);
  return tiles.indexWhere((tile) => tile.id == list[index]);

  }
}