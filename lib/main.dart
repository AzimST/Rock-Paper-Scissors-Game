import 'package:flutter/material.dart';
import 'package:rockpaperscissorsgame/Demos/dragitems.dart';
import 'package:rockpaperscissorsgame/Demos/gameDemos.dart';
import 'package:rockpaperscissorsgame/Screens/gameScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
        cardTheme: CardTheme(
            color: Colors.grey[300],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)))),
        primarySwatch: Colors.grey,
      ),
      home: DragDemos(),
    );
  }
}
