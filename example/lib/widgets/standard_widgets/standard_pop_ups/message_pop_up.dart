import 'package:flutter/material.dart';

class MessagePopUp extends StatelessWidget {
  final String message;

  MessagePopUp({@required this.message});

  /// Shows this message pop up.
  void show(BuildContext context) {
    showDialog(context: context, builder: (context) => build(context));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(Icons.info),
      content: Text(
        message,
        style: TextStyle(
          fontFamily: "ProximasNova",
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.check),
          color: Colors.green,
          iconSize: 30,
          splashRadius: 1,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
