import 'package:auth_demo/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget () {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color:  AppColor.red400,
              gradient: AppColor.linearGradient
            ),
          ),
          const Center(
            child: Text(
              "</DSAghicha>",
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Courgette"
              )
            ),
          )
        ],
      )
    );
  }
}