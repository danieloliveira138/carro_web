import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String title;
  Function onPressed;
  bool showProgress;

  AppButton(this.title, this.onPressed, {this.showProgress = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blueAccent,
        child: _enableProgress(showProgress),
        onPressed: onPressed,
      ),
    );
  }

  Widget _enableProgress(bool enable) {
    return enable
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        : Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          );
  }
}
