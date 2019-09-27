import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  String errorMessage;

  TextError(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyle(
          color: Colors.red,
          fontSize: 22,
          decorationStyle: TextDecorationStyle.solid,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
