import 'package:flutter/material.dart';
import 'dart:math';

class PointsOverlay extends StatefulWidget {
  final bool _addPoints; // if false subtract from score.
  final int _points;
  final VoidCallback _onTap;

  PointsOverlay(this._addPoints, this._points, this._onTap);

  @override
  State createState() => PointsOverlayState();
}

class PointsOverlayState extends State<PointsOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _iconAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: Text(
                  widget._addPoints == true
                      ? "+" + widget._points.toString()
                      : "-" + widget._points.toString(),
                  style: TextStyle(fontSize: _iconAnimation.value * 80.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
