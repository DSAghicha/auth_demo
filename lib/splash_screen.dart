import 'dart:async';

import 'package:auth_demo/brand/brand.dart';
import 'package:auth_demo/colors.dart';
import 'package:auth_demo/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    // var duration = const Duration(seconds: 3);
    return Timer(const Duration(seconds: 5), loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()
        )
    );
  }

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
            child: BrandText(40)
          )
        ],
      )
    );
  }
}