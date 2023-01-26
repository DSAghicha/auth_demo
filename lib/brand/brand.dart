import 'package:flutter/material.dart';
import '../colors.dart';

class BrandText extends StatelessWidget {
  const BrandText(this.size, {super.key});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
        "</DSAghicha>",
        style: TextStyle(
            color: AppColor.white,
            fontSize: size,
            fontWeight: FontWeight.bold,
            fontFamily: "Courgette"
        )
    );
  }

}