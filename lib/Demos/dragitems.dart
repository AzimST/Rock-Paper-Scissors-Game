import 'package:flutter/material.dart';

class DragDemos extends StatefulWidget {
  const DragDemos({super.key});

  @override
  State<DragDemos> createState() => _DragDemosState();
}

class _DragDemosState extends State<DragDemos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drag Demos")),
      body: Column(
        children: [
          Center(
              child: Row(
            children: [
              const Draggable<Color>(
                data: Colors.amber,
                child: _customBox(text: "Dragme", color: Colors.green),
                feedback: Material(
                  child: _customBox(
                    color: Colors.red,
                    text: "Dragged",
                  ),
                ),
                childWhenDragging:
                    _customBox(text: "Behind", color: Colors.orange),
              ),
              DragTarget(
                builder: ((context, candidateData, rejectedData) {
                  return Container(
                    height: 50,
                    width: 50,
                    color: Colors.black38,
                  );
                }),
                onAccept: (data) {},
              )
            ],
          )),
        ],
      ),
    );
  }
}

class _customBox extends StatelessWidget {
  const _customBox({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      color: color,
      child: Center(child: Text(text)),
    );
  }
}
