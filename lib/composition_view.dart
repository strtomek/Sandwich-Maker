import 'package:flutter/material.dart';
import 'package:flutter_workshops/components/action_button_bar.dart';
import 'package:flutter_workshops/components/elements_stack.dart';

import 'components/submit_button.dart';
import 'model/ingredient.dart';

class CompositionView extends StatefulWidget {
  final String title;
  CompositionView({Key key, this.title}) : super(key: key);

  _CompositionViewState createState() => _CompositionViewState();
}

class _CompositionViewState extends State<CompositionView>
    with TickerProviderStateMixin {
  AnimationController _compressionController;
  Animation<double> _compressionAnimation;
  final List<Ingredient> _buttons = [
    Ingredient(image: 'images/bread.png'),
    Ingredient(image: 'images/cheese.png'),
    Ingredient(image: 'images/ham.png'),
    Ingredient(image: 'images/salad.png'),
    Ingredient(image: 'images/tomato.png')
  ];

  final List<Ingredient> _elements = [
    Ingredient(),
    Ingredient(),
    Ingredient(),
    Ingredient(),
    Ingredient()
  ];

  @override
  void initState() {
    super.initState();
    this._compressionController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700))
          ..addListener(this._changeState);
    this._compressionAnimation =
        Tween<double>(begin: 1, end: 0.3).animate(this._compressionController);
  }

  @override
  void dispose() {
    super.dispose();
    this._compressionController.removeListener(this._changeState);
  }

  _changeState() {
    this.setState(() {});
  }

  _onSubmitclick() {
    this._compressionController.forward();
  }

  _onReverseSandwitchCreate() {
    this._compressionController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  _onReverseSandwitchCreate();
                },
                child: Icon(
                  Icons.replay,
                  color: Colors.black,
                ),
              ),
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.orange[400],
          title: Text(
            this.widget.title,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: ElementsStack(
                  elements: this._elements,
                  compressionValue: this._compressionAnimation.value,
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ActionButtonsBar(buttons: this._buttons),
                      SubmitButton(
                        text: 'Zapisz kanapkę',
                        onPressed: this._onSubmitclick,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
