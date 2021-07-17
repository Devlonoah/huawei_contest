import 'package:flutter/cupertino.dart';

class DS {
  static late double sh;
  static late double sw;
  late MediaQueryData mediaQueryData;
  static late double widthGap;
  static void init(BuildContext context) {
    var mq = MediaQuery.of(context);
    sh = mq.size.height;
    sw = mq.size.width;
    widthGap = sw * 0.11;
  }

  static double getBothSide(double value) {
    return value * (sh / sw);
  }
}
