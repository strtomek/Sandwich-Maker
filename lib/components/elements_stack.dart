import 'package:flutter/material.dart';
import 'package:flutter_workshops/components/action_button_bar.dart';
import 'package:flutter_workshops/model/ingredient.dart';

class ElementsStack extends StatelessWidget {
  final List<Ingredient> elements;
  final double compressionValue;
  const ElementsStack({Key key, this.elements, this.compressionValue})
      : super(key: key);

  Widget _generate(int index) {
    return DragTarget<Ingredient>(
      builder: (BuildContext context, List<Ingredient> candidate,
          List<dynamic> rejected) {
        return Padding(
          padding: EdgeInsets.only(top: index * 80 * compressionValue),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: !this.elements[index].isVisible
                ? BoxDecoration(
                    border: Border.all(color: Colors.grey[300]),
                  )
                : null,
            child: this.elements[index].isVisible
                ? ImageView(
                    image: this.elements[index].image,
                  )
                : null,
          ),
        );
      },
      onWillAccept: (_) => true,
      onAccept: (Ingredient element) {
        this.elements[index] = element..isVisible = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: List<Widget>.generate(this.elements.length, _generate)
              .reversed
              .toList(),
        ),
      ),
    );
  }
}
