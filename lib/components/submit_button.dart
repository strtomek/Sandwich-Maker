import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key, this.onPressed, this.text}) : super(key: key);
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 60,
              child: RaisedButton(
                color: Colors.orange,
                highlightColor: Colors.blue,
                splashColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: this.onPressed,
                child: Text(this.text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
