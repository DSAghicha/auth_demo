import 'package:flutter/widgets.dart';

class AppColor {
    AppColor._();

    static const Color red200 = Color(0xffff5131);
    static const Color red400 = Color(0xffD50000);
    static const Color red600 = Color(0xff9b0000);
    static const Color red900 = Color(0xff7f0000);
    static const Color white = Color(0xffFFFFFF);
    static const Gradient linearGradient = LinearGradient(
        colors: [AppColor.red200, AppColor.red600],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
    );
}