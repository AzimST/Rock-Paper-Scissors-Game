import 'package:flutter/material.dart';

class ProjectTitle {
  final String paperButton = "Paper";
  final String rockButton = "Rock";
  final String scissorsButton = "scissors";
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

class GameAction {
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
}
