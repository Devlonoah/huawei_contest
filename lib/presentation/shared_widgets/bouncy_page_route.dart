import 'package:flutter/cupertino.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget widget;

  final Object? arguments;
  BouncyPageRoute({required this.widget, this.arguments})
      : super(
            transitionDuration: Duration(milliseconds: 300),
            settings: RouteSettings(arguments: arguments),
            pageBuilder: (context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secondaryAnimation, child) {
              final bouncyanimation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);

              final offsetAnimation =
                  Tween(begin: Offset(1, 0), end: Offset(0, 0))
                      .animate(animation);
              final customAnimWithCurves =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);

              return Align(
                  child: SizeTransition(
                      sizeFactor: customAnimWithCurves, child: child));
            });
}


// AddEdit()
//  ScreenArgument(isNewNote: false, noteId: noteId)
