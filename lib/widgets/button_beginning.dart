import 'package:flutter/material.dart';
import 'package:jogo_velha/controllers/game_controller.dart';

class ButtonBeginning extends StatefulWidget {
  final GameController controller;
  const ButtonBeginning({super.key, required this.controller});

  @override
  State<ButtonBeginning> createState() => _ButtonBeginningState();
}

class _ButtonBeginningState extends State<ButtonBeginning> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          widget.controller.clickBeginningBtn();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 50), backgroundColor: Colors.amber
        ),
        child: Text(
          widget.controller.plays > 0 ? "Jogar Novamente" : "Bora Jogar!",
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
