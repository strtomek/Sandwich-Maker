import 'package:flutter/material.dart';
import 'package:flutter_workshops/components/submit_button.dart';
import 'package:flutter_workshops/composition_view.dart';

class InitView extends StatelessWidget {
  const InitView({Key key}) : super(key: key);

  _navigateToComposition(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return CompositionView(
            title: 'Stwórz Kanapkę',
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Text(
          'Pan Kanapka',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange[400],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Image.asset('images/sandwitch.png'),
            ),
            Expanded(
              flex: 2,
              child: SubmitButton(
                text: 'Stwórz kanapkę',
                onPressed: () {
                  this._navigateToComposition(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
