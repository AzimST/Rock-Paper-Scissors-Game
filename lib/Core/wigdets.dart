import 'package:flutter/material.dart';
import 'package:rockpaperscissorsgame/Core/tools.dart';

import '../Screens/gameScreen.dart';

// THİS WİGDET İS USED İN GAMESCREEN
class customHeadLineCard extends StatefulWidget {
  const customHeadLineCard({
    Key? key,
  }) : super(key: key);

  @override
  State<customHeadLineCard> createState() => _customHeadLineCardState();
}

class _customHeadLineCardState extends State<customHeadLineCard> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ELEVATED BUTTON STYLE
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black54,
        shape: StadiumBorder(),
      ),
      // THİS ONPRESS İS RESET TO SCORE TABLE
      onPressed: () {
        playerWin = 0;
        computerWin = 0;

        setState(() {});
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 35, right: 35),
        child: Text(
          "Player win Round: ${playerWin.toString()}\nComputer win Round: ${computerWin.toString()}",
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

// this wigdet uses of gamescreen
class customTable extends StatelessWidget {
  const customTable({
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
              // İF THE GAME HAS JUST STARTED, I SHOW INFORMATION FOR GAME
              child: gameresult == ""
                  // ignore: prefer_const_constructors
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                          textAlign: TextAlign.center,
                          "Welcome the Rock-Paper-Scissor game. \tThis game is look like normal RPS game but it isn't normal."),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 4,
                              child: _customTableColumn(
                                action: pcAction,
                                title: "Computer Action",
                                imageName: pcAction,
                              )),
                          Expanded(
                              flex: 3,
                              child: _customTableColumn(
                                action: playerAction,
                                title: "Player Action",
                                imageName: playerAction,
                              )),
                          Expanded(
                              flex: 3,
                              child: _customTableColumn(
                                  action: gameresult, title: "Game Result")),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

//private wigdet
class _customTableColumn extends StatelessWidget {
  const _customTableColumn({
    Key? key,
    required this.action,
    required this.title,
    this.imageName = "",
  }) : super(key: key);

  final String action, title, imageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Divider(),
        Text("${action.toUpperCase()}"),
        if (imageName == "")
          ...[]
        else ...[
          Divider(),
          SizedBox(height: 100, width: 100, child: PngImage(name: action))
        ]
      ],
    );
  }
}
