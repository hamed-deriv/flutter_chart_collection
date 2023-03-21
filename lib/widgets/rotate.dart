import 'package:flutter/material.dart';

/// A widget for rotating its child.
class Rotate extends StatefulWidget {
  /// Initializes a new [Rotate].
  const Rotate({required this.child, Key? key}) : super(key: key);

  /// The child to be rotated.
  final Widget child;

  @override
  State<Rotate> createState() => _RotateState();
}

class _RotateState extends State<Rotate> {
  double _rotation = 0;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onPanUpdate: (DragUpdateDetails details) =>
            setState(() => _rotation += details.delta.dy / 100),
        child: Transform.rotate(angle: _rotation, child: widget.child),
      );
}
