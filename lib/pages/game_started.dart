import 'package:flutter/material.dart';
import 'package:mastermind/components/right_choices.dart';
import 'package:mastermind/components/square.dart';
import 'package:mastermind/services/my_functions.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class GameStarted extends StatefulWidget {
  GameStarted({
    super.key,
    required this.wordToGuess,
  });

  String wordToGuess;

  @override
  State<GameStarted> createState() => _GameStartedState();
}

class _GameStartedState extends State<GameStarted> {
  // send combination to first free row
  int rowCounter = 0;

  void sendCombination() {
    if (rowCounter < 10) {
      setState(
        () {
          squareList[0 + (4 * rowCounter)] = _currentValue0.toString();
          squareList[1 + (4 * rowCounter)] = _currentValue1.toString();
          squareList[2 + (4 * rowCounter)] = _currentValue2.toString();
          squareList[3 + (4 * rowCounter)] = _currentValue3.toString();

          circleListRightNumbersAtRightPosition[rowCounter] = MyFunctions()
              .countRightNumbersAtRightPosition(
                widget.wordToGuess,
                squareList[0 + (4 * rowCounter)],
                squareList[1 + (4 * rowCounter)],
                squareList[2 + (4 * rowCounter)],
                squareList[3 + (4 * rowCounter)],
              )
              .toString();

          circleListRightNumbers[rowCounter] = MyFunctions()
              .countGenericRightNumbers(
                widget.wordToGuess,
                squareList[0 + (4 * rowCounter)],
                squareList[1 + (4 * rowCounter)],
                squareList[2 + (4 * rowCounter)],
                squareList[3 + (4 * rowCounter)],
              )
              .toString();

          if (widget.wordToGuess ==
              squareList[0 + (4 * rowCounter)] +
                  squareList[1 + (4 * rowCounter)] +
                  squareList[2 + (4 * rowCounter)] +
                  squareList[3 + (4 * rowCounter)]) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Hai vinto!'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('La combinazione da indovinare era: '),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.wordToGuess,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      resetGame();
                    },
                    child: const Text(
                      'Ricomincia',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      );
      rowCounter++;
    }
    if (rowCounter == 10) {
      showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('Hai perso!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('La combinazione da indovinare era: '),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.wordToGuess,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  resetGame();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ricomincia',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  // reset table game
  void resetGame() {
    for (int i = 0; i < 40; i++) {
      setState(() {
        squareList[i] = '';
      });
    }

    for (int j = 0; j < 10; j++) {
      setState(() {
        circleListRightNumbersAtRightPosition[j] = '';
        circleListRightNumbers[j] = '';
      });
    }

    rowCounter = 0;
    _currentValue0 = 0;
    _currentValue1 = 0;
    _currentValue2 = 0;
    _currentValue3 = 0;

    setState(() {
      widget.wordToGuess = MyFunctions().createWordToGuess();
    });
  }

  List squareList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  List circleListRightNumbersAtRightPosition = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  List circleListRightNumbers = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int _currentValue0 = 0;
  int _currentValue1 = 0;
  int _currentValue2 = 0;
  int _currentValue3 = 0;

  int rowCount = 0;
  int colCount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          // title: Text(widget.wordToGuess),
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: resetGame,
            child: const Icon(Icons.replay),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      verticalDirection: VerticalDirection.up,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        10,
                        (index) => RightChoicesRow(
                          rightNumbersAtRightPosition:
                              circleListRightNumbersAtRightPosition[index],
                          rightNumbers: circleListRightNumbers[index],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.blue[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (rowCount = 0; rowCount < 4; rowCount++)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              verticalDirection: VerticalDirection.up,
                              children: [
                                for (colCount = 0; colCount < 10; colCount++)
                                  Square(
                                    number:
                                        squareList[rowCount + (4 * colCount)],
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue[850],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      NumberPicker(
                        textStyle: const TextStyle(color: Colors.white),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.teal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minValue: 0,
                        maxValue: 9,
                        value: _currentValue0,
                        onChanged: (value) => setState(
                          () {
                            _currentValue0 = value;
                          },
                        ),
                        itemWidth: MediaQuery.of(context).size.width / 5,
                      ),
                      NumberPicker(
                        textStyle: const TextStyle(color: Colors.white),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.teal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minValue: 0,
                        maxValue: 9,
                        value: _currentValue1,
                        onChanged: (value) => setState(
                          () {
                            _currentValue1 = value;
                          },
                        ),
                        itemWidth: MediaQuery.of(context).size.width / 5,
                      ),
                      NumberPicker(
                        textStyle: const TextStyle(color: Colors.white),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.teal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minValue: 0,
                        maxValue: 9,
                        value: _currentValue2,
                        onChanged: (value) => setState(
                          () {
                            _currentValue2 = value;
                          },
                        ),
                        itemWidth: MediaQuery.of(context).size.width / 5,
                      ),
                      NumberPicker(
                        textStyle: const TextStyle(color: Colors.white),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.teal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minValue: 0,
                        maxValue: 9,
                        value: _currentValue3,
                        onChanged: (value) => setState(
                          () {
                            _currentValue3 = value;
                          },
                        ),
                        itemWidth: MediaQuery.of(context).size.width / 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          onTap: sendCombination,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: MediaQuery.of(context).size.width / 5 - 32,
                            height: MediaQuery.of(context).size.width / 5 - 32,
                            child: const Icon(Icons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
