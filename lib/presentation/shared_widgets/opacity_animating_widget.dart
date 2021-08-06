import 'package:flutter/material.dart';

class OpacityAnimatingWidget extends StatefulWidget {
  final Widget widget;
  const OpacityAnimatingWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  _OpacityAnimatingWidgetState createState() => _OpacityAnimatingWidgetState();
}

class _OpacityAnimatingWidgetState extends State<OpacityAnimatingWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 850));
    super.initState();

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Opacity(
          opacity: animationController.value,
          child: widget.widget,
        );
      },
    );
  }
}
