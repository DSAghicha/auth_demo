import 'dart:io';

import 'package:auth_demo/brand/brand.dart';
import 'package:auth_demo/colors.dart';
import 'package:auth_demo/preventions/digital_instrumentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // *** TOP CONTAINER ***
            Container(
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
                color: AppColor.red900,
                gradient: AppColor.linearGradient
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    BrandText(30),
                  ],
                ),
              ),
            ),
            // *** BOTTOM CONTAINER ***
            Container(
              margin: const EdgeInsets.all(10),
              width: double.maxFinite,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DigitalInstrumentation(),
                  TextButton(
                      onPressed: () => {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Instrumentation Detected!"),
                              content: const Text("Something went wrong!\n\nPlease reinstall app from your Playstore/AppStore."),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () => {
                                      if (Platform.isAndroid) {
                                        SystemNavigator.pop()
                                      } else if (Platform.isIOS) {
                                        exit(0)
                                      }
                                    },
                                    child: const Text("Close"))
                              ],

                            )
                        )
                      },
                      child: const Text("Test Alert Dialog"))
                ],
              ),
            )
          ],
        ),
      )
    );
}
}