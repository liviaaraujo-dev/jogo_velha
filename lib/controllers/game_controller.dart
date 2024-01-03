import 'package:flutter/material.dart';

class GameController extends ChangeNotifier{
  List grid = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  String playerCurrent = 'X';
  String informationalText = 'Vamos começar?';
  bool gameStarted = false;
  int plays = 0;
  bool existsWinner = false;

  //logica do click my_button 
  void clickMyBtn({required int linha, required int column}) {
    plays++;
    grid[linha][column] = playerCurrent;
    existsWinner =
        checksWinner(player: playerCurrent, line: linha, column: column);

    if (existsWinner) {
      informationalText = '$playerCurrent Venceu!';
      gameStarted = false;
    } else if (existsWinner == false && plays == 9) {
      informationalText = 'Empate!';
      gameStarted = false;
    } else {
      if (playerCurrent == 'X') {
        playerCurrent = 'O';
      } else {
        playerCurrent = 'X';
      }
      informationalText = '$playerCurrent é sua vez.';
    }
    notifyListeners();
  }

  bool checksWinner(
      {required String player, required int line, required int column}) {

    bool won = true;
    
    //verfica linha
    for (int i = 0; i < 3; i++) {
      if (grid[line][i] != player) {
        won = false;
        break;
      }
    }

    //verifica coluna
    if (won == false) {
      for (int j = 0; j < 3; j++) {
        if (grid[j][column] != player) {
          won = false;
          break;
        } else {
          won = true;
        }
      }
    }

    //verifica diagonal
    if (won == false) {
      if (grid[1][1] == player) {
        if (grid[0][0] == player && grid[2][2] == player) {
          won = true;
        } else if (grid[0][2] == player && grid[2][0] == player) {
          won = true;
        }
      }
    }

    return won;
  }

  clickBeginningBtn(){
    gameStarted = true;
    plays = 0;
    grid = List.generate(3, (i) => List.filled(3, ''));
    informationalText = '$playerCurrent é sua vez.';

    notifyListeners();
  }
}
