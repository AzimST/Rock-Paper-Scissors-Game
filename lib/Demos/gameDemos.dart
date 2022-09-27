import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

int playerWin = 0, computerWin = 0;

late bool isTimeFinish = false;
var gameAction = [
  "paper",
  "paper",
  "paper",
  "paper",
  "paper",
  "paper",
  "paper",
  "rock",
  "rock",
  "rock",
  "rock",
  "rock",
  "rock",
  "scissors",
  "scissors",
  "scissors",
  "scissors",
  "scissors",
  "scissors",
];
final _random = new Random();

class GameDemo extends StatefulWidget {
  const GameDemo({super.key});

  @override
  State<GameDemo> createState() => _GameDemoState();
}

class _GameDemoState extends State<GameDemo> {
  late String pcAction = gameAction[_random.nextInt(gameAction.length)];
  late String title1 = gameAction[_random.nextInt(gameAction.length)];
  late String title2 = gameAction[_random.nextInt(gameAction.length)];
  late String title3 = gameAction[_random.nextInt(gameAction.length)];

  late String playerAction = "", gameresult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            _customHeadLineCard(),
            SizedBox(
              height: 50,
            ),
            _customTable(
              pcAction: pcAction,
              playerAction: playerAction,
              gameresult: gameresult,
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
      onEnd: () {
        isTimeFinish = !isTimeFinish;
        setState(() {});
      },
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
            pcAction = gameAction[_random.nextInt(gameAction.length)];

            playerAction = action;
            GameController(pcAction, playerAction);
            isTimeFinish = !isTimeFinish;
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
      playerWin++;
    } else {
      gameresult = "Computer win";
      print("Computer win");
      computerWin++;
    }
    title1 = gameAction[_random.nextInt(gameAction.length)];
    title2 = gameAction[_random.nextInt(gameAction.length)];
    title3 = gameAction[_random.nextInt(gameAction.length)];
  }
}

class _customHeadLineCard extends StatelessWidget {
  const _customHeadLineCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Player win Round: ${playerWin.toString()}\nComputer win Round: ${computerWin.toString()}",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _customTable extends StatelessWidget {
  const _customTable({
    Key? key,
    required this.pcAction,
    required this.playerAction,
    required this.gameresult,
  }) : super(key: key);

  final String pcAction;
  final String playerAction;
  final String gameresult;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Center(
              child: gameresult == ""
                  // ignore: prefer_const_constructors
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                          textAlign: TextAlign.center,
                          "Welcome the Rock-Paper-Scissor game. \tThis game is look like normal RPS game but it isn't normal."),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 3,
                            child: _customTableColumn(
                              action: pcAction,
                              title: "Computer Action",
                            )),
                        Expanded(
                            flex: 3,
                            child: _customTableColumn(
                                action: playerAction, title: "Player Action")),
                        Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Text("Game Result"),
                                Divider(),
                                Text("$gameresult"),
                              ],
                            )),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _customTableColumn extends StatelessWidget {
  const _customTableColumn({
    Key? key,
    required this.action,
    required this.title,
  }) : super(key: key);

  final String action, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Divider(),
        Text("$action"),
        Divider(),
        SizedBox(height: 140, width: 100, child: PngImage(name: action))
      ],
    );
  }
}

class ProjectTitle {
  final String paperButton = "Paper";
  final String rockButton = "Rock";
  final String scissorsButton = "scissors";
}

class ProjectImageName {
  final String paper = "paper";
  final String stone = "rock";
  final String scissors = "scissors";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$name.png",
      fit: BoxFit.contain,
      height: 300,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.error_outline_outlined,
        size: 50,
      ),
    );
  }
}
