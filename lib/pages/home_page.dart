import 'package:flutter/material.dart';
import 'package:mastermind/services/my_functions.dart';
import 'game_started.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text(
                    'MasterMind',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'GAME',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GameStarted(
                          wordToGuess: MyFunctions().createWordToGuess()),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
