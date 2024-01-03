import 'package:flutter/material.dart';
import 'package:jogo_velha/controllers/game_controller.dart';

class MyButton extends StatefulWidget {
  final GameController controller;
  final int line;
  final int column;
  const MyButton({super.key, required this.controller, required this.line, required this.column});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AbsorbPointer(
        absorbing: widget.controller.grid[widget.line][widget.column] == '' ? false : true,
        child: ElevatedButton(
          onPressed: () {
          widget.controller.clickMyBtn(column: widget.column, linha: widget.line);
          },
          style: ElevatedButton.styleFrom(
            shape:const  RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Define bordas retas
              ),
              fixedSize: const Size(100, 100), backgroundColor: Colors.black38),
          child: Text(
            widget.controller.grid[widget.line][widget.column],
            style: const TextStyle(fontSize: 50, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
