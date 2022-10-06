import 'package:flutter/material.dart';

class ProjectTitle {
  final String paperButton = "Paper";
  final String rockButton = "Rock";
  final String scissorsButton = "scissors";
}

class PngImage extends StatelessWidget {
  const PngImage(
      {Key? key, required this.name, required this.height, required this.size})
      : super(key: key);
  final String name;
  final double height, size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$name.png",
      fit: BoxFit.contain,
      height: height,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.error_outline_outlined,
        size: size,
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
