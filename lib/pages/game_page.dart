import 'package:flutter/material.dart';
import 'package:jogo_velha/widgets/button_beginning.dart';

import '../controllers/game_controller.dart';
import '../widgets/my_button.dart';


class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  final GameController _controller = GameController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.removeListener(() { });
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AbsorbPointer(
                  absorbing: !_controller.gameStarted,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Jogo da Velha",
                              style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        MyButton(controller: _controller, line: 0, column: 0),
                        MyButton(controller: _controller, line: 0, column: 1),
                        MyButton(controller: _controller, line: 0, column: 2),
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        MyButton(controller: _controller, line: 1, column: 0),
                        MyButton(controller: _controller, line: 1, column: 1),
                        MyButton(controller: _controller, line: 1, column: 2),
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        MyButton(controller: _controller, line: 2, column: 0),
                        MyButton(controller: _controller, line: 2, column: 1),
                        MyButton(controller: _controller, line: 2, column: 2),
                      ]),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        _controller.informationalText,
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Visibility(
                      visible: _controller.gameStarted == true ? false : true, 
                      child: ButtonBeginning(controller: _controller)
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: _controller.existsWinner && _controller.gameStarted == false,
            child: Positioned(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/confetti.gif',
                      height: size.height * .8,
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
