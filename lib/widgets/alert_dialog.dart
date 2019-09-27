import 'package:flutter/material.dart';

alertDialog(BuildContext context, String title, String message, {Function cancel,
  Function ok, bool dismissible = true}) {

  List<FlatButton> _buttons = [];

  if(cancel != null) {
    _buttons.add(
        FlatButton(
            child: Text('Cancelar'),
            onPressed: cancel
        )
    );
  }

  if(ok != null) {
    _buttons.add(
        FlatButton(
            child: Text('OK'),
            onPressed: ok
        )
    );
  }

  showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return AlertDialog(
          elevation: 8,
          title: Text(title),
          content: Text(message),
          actions: _buttons,
        );
      }
  );
}