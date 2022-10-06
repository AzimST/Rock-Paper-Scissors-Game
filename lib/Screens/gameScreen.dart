import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:rockpaperscissorsgame/Core/tools.dart';

import '../Core/wigdets.dart';

int playerWin = 0;
int computerWin = 0;
final _random = new Random();

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String pcAction =
      GameAction().gameAction[_random.nextInt(GameAction().gameAction.length)];
  late String title1 =
      GameAction().gameAction[_random.nextInt(GameAction().gameAction.length)];
  late String title2 =
      GameAction().gameAction[_random.nextInt(GameAction().gameAction.length)];
  late String title3 =
      GameAction().gameAction[_random.nextInt(GameAction().gameAction.length)];

  late String playerAction = "", gameresult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            customHeadLineCard(),
            SizedBox(
              height: 40,
            ),
            Center(
              child: customTable(
                pcAction: pcAction,
                playerAction: playerAction,
                gameresult: gameresult,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _customElevatedButton(
                  title1,
                  title1,
                ),
                _customElevatedButton(
                  title2,
                  title2,
                ),
                _customElevatedButton(
                  title3,
                  title3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CountDown() {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
    return CountdownTimer(
      endTime: endTime,
      endWidget: Text("Go"),
      onEnd: () {},
      textStyle:
          Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),
    );
  }

  Widget _customElevatedButton(String title, String action) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              maximumSize: Size(90, 100), minimumSize: Size(90, 100)),
          onPressed: () {
            pcAction = GameAction()
                .gameAction[_random.nextInt(GameAction().gameAction.length)];

            playerAction = action;
            GameController(pcAction, playerAction);
            setState(() {});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (title == "paper") ...[
                const Icon(Icons.copy)
              ] else if (title == "rock") ...[
                const Icon(Icons.stop)
              ] else ...[
                const Icon(Icons.cut)
              ],
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 15),
                child: Text(title),
              ),
            ],
          )),
    );
  }

  void GameController(String pcAction, String playerAction) {
    if (pcAction == playerAction) {
      gameresult = "tie";
      print("tie");
    } else if (playerAction == "paper" && pcAction == "rock" ||
        playerAction == "scissors" && pcAction == "paper" ||
        playerAction == "rock" && pcAction == "scissors") {
      gameresult = "player win";
      print("player win");
      //playerWin++;
    } else {
      gameresult = "Computer win";
      //print("Computer win");
      computerWin++;
    }

    title1 = GameAction()
        .gameAction[_random.nextInt(GameAction().gameAction.length)];
    title2 = GameAction()
        .gameAction[_random.nextInt(GameAction().gameAction.length)];
    title3 = GameAction()
        .gameAction[_random.nextInt(GameAction().gameAction.length)];
  }
}


