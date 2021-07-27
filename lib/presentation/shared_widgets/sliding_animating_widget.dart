import 'package:flutter/material.dart';

class ScaleAnimatingWidget extends StatefulWidget {
  final Widget widget;
  const ScaleAnimatingWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  _ScaleAnimatingWidgetState createState() => _ScaleAnimatingWidgetState();
}

class _ScaleAnimatingWidgetState extends State<ScaleAnimatingWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> animation;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0, 0.5, curve: Curves.bounceInOut),
    ));

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animation.removeListener(() {});

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return ScaleTransition(
          scale: animation,
          child: widget.widget,
        );
      },
    );
  }
}
