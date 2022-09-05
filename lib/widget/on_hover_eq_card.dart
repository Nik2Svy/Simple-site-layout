import 'package:flutter/material.dart';

class OnHoverCard extends StatefulWidget {
  final Widget child;

  const OnHoverCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  OnHoverCardState createState() => OnHoverCardState();
}

class OnHoverCardState extends State<OnHoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform,
          child: widget.child),
    );
  }

  onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
