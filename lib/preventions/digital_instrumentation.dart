import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freerasp/talsec_app.dart';
import 'package:freerasp/utils/hash_converter.dart';

class DigitalInstrumentation extends StatefulWidget{
  const DigitalInstrumentation({super.key});

  @override
  State<StatefulWidget> createState() => InitState();

}

class InitState extends State<DigitalInstrumentation> {
  final ThreatType _root = ThreatType("Root");
  final ThreatType _emulator = ThreatType("Emulator");
  final ThreatType _tamper = ThreatType("Tamper");
  final ThreatType _hook = ThreatType("Hook");
  final ThreatType _deviceBinding = ThreatType("Device binding");
  final ThreatType _untrustedSource = ThreatType("Untrusted source of installation");
  final ThreatType _debugger = ThreatType("Debugger");

  List<Widget> get overview {
    return [
      Text(_root.state),
      Text(_debugger.state),
      Text(_emulator.state),
      Text(_tamper.state),
      Text(_hook.state),
      Text(_deviceBinding.state),
      Text(_untrustedSource.state),
    ];
  }

  @override
  void initState() {
    super.initState();
    initSecurityState();
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Column(
        children: [...overview],
      );
  }

  Future<void> initSecurityState() async {
    String base64Hash = hashConverter.fromSha256toBase64('88:8c:7f:02:d6:2e:ed:3a:53:bb:9c:a6:6b:82:5c:0d:78:a8:e5:b6:b2:11:28:bc:f5:ac:67:c8:e0:a3:7c:5a');
    final TalsecConfig config = TalsecConfig(
      androidConfig: AndroidConfig(
        expectedPackageName: 'com.dsaghicha.testApp',
        expectedSigningCertificateHash: base64Hash,
        supportedAlternativeStores: ["com.sec.android.app.samsungapps"],
      ),
      watcherMail: 'darshaandaghicha@gmail.com',
    );

    final TalsecCallback callback = TalsecCallback(
      androidCallback: AndroidCallback(
        onRootDetected: () => updateState(_root),
        onEmulatorDetected: () => updateState(_emulator),
        onHookDetected: () => updateState(_hook),
        onTamperDetected: () => updateState(_tamper),
        onDeviceBindingDetected: () => updateState(_deviceBinding),
        onUntrustedInstallationDetected: () => updateState(_untrustedSource),
      ),
      onDebuggerDetected: () => updateState(_debugger),
    );

    final TalsecApp app = TalsecApp(
      config: config,
      callback: callback,
    );

    app.start();
    if (!mounted) return;
  }

  void updateState(final ThreatType type) {
    setState(() {
      // ignore: parameter_assignments
      type.threatFound();
     showDialog(
         context: context,
         barrierDismissible: false,
         builder: (BuildContext context) => AlertDialog(
           title: const Text("Instrumentation Detected!"),
           content: const Text("Something went wrong!\nPlease reinstall app from your Playstore/AppStore."),
           actions: <Widget>[
             TextButton(
                 onPressed: () => {
                   if (Platform.isAndroid) {
                     SystemNavigator.pop()
                   } else if (Platform.isIOS) {
                     exit(0)
                   }
                 },
                 child: const Text("Close")
             )
           ],

         ));
    });
  }
}

class ThreatType {
  final String _text;
  bool _isSecure = true;
  ThreatType(this._text);
  void threatFound() => _isSecure = false;
  String get state => '$_text: ${_isSecure ? "Secured" : "Detected"}\n';
}