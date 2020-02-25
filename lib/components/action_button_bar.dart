import 'package:flutter/material.dart';
import 'package:flutter_workshops/model/ingredient.dart';

class ActionButtonsBar extends StatefulWidget {
  final List<Ingredient> buttons;
  ActionButtonsBar({Key key, this.buttons}) : super(key: key);

  _ActionButtonsBarState createState() => _ActionButtonsBarState();
}

class _ActionButtonsBarState extends State<ActionButtonsBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  _changeSize(double size) {
    this._controller.animateTo(size);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.buttons.length,
        itemBuilder: (BuildContext context, int index) {
          return Draggable<Ingredient>(
            data: this.widget.buttons[index],
            feedback: FeedbackItem(
              image: this.widget.buttons[index].image,
              controller: _controller,
              minSize: 40,
              maxSize: 90,
            ),
            onDragStarted: () => _changeSize(1),
            onDragEnd: (_) => _changeSize(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 65,
                height: 60,
                child: RaisedButton(
                  color: Colors.grey[350],
                  child: ImageView(
                    image: this.widget.buttons[index].image,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FeedbackItem extends AnimatedWidget {
  final String image;
  final double minSize;
  final double maxSize;

  const FeedbackItem(
      {Key key,
      this.image,
      this.minSize,
      this.maxSize,
      AnimationController controller})
      : super(key: key, listenable: controller);

  @override
  Widget build(BuildContext context) {
    Animation<double> imageSize =
        Tween<double>(begin: this.minSize, end: this.maxSize).animate(
      CurvedAnimation(parent: this.listenable, curve: Curves.linear),
    );
    return ImageView(
      image: this.image,
      size: imageSize.value,
    );
  }
}

class ImageView extends StatelessWidget {
  final double size;
  final String image;
  const ImageView({Key key, this.size, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Image.asset(image),
    );
  }
}
