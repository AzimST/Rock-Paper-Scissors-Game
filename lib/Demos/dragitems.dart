import 'package:flutter/material.dart';
import 'package:rockpaperscissorsgame/Core/tools.dart';

class DragDemos extends StatefulWidget {
  const DragDemos({super.key});

  @override
  State<DragDemos> createState() => _DragDemosState();
}

class _DragDemosState extends State<DragDemos> {
  late String boxtitle = "";
  final String dragtitle = "deneme";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drag Demos")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Draggable<Color>(
            data: Colors.amber,
            child: Text("${dragtitle}"),
            feedback: Material(
              child: Text(
                dragtitle,
                style: TextStyle(backgroundColor: Colors.blue, fontSize: 20),
              ),
            ),
            childWhenDragging: SizedBox(),
          ),
          DragTarget(
            builder: ((context, candidateData, rejectedData) {
              return Container(
                child: Draggable(
                  feedback: Material(child: Text(boxtitle)),
                  child: Text(boxtitle),
                ),
                height: 50,
                width: 500,
                color: Colors.black38,
              );
            }),
            onAccept: (data) {
              boxtitle = boxtitle + " " + dragtitle;
            },
          ),
          DragTarget(
            builder: ((context, candidateData, rejectedData) {
              return Icon(Icons.delete_forever);
            }),
            onAccept: (data) {},
          ),
        ],
      ),
    );
  }
}

class _customCard extends StatefulWidget {
  const _customCard({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<_customCard> createState() => _customCardState();
}

class _customCardState extends State<_customCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              maximumSize: Size(90, 100), minimumSize: Size(90, 100)),
          onPressed: () {
            setState(() {});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PngImage(
                name: widget.title,
                height: 50,
                size: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 15,
                ),
                child: Text(widget.title),
              ),
            ],
          )),
    );
  }
}

class _customBox extends StatelessWidget {
  const _customBox({
    Key? key,
    this.text = "",
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 90,
      color: color,
      child: Center(child: Text(text)),
    );
  }
}
