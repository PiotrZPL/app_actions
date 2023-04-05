import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:app_actions/app_actions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Open Gmail"),
              ElevatedButton(
                onPressed: () {
                  AppActions().openApp(appName: "com.google.android.gm");
                },
                child: const Text("Press")
              ),
              ElevatedButton(
                onPressed: () {
                  AppActions().openAppSettings(appName: "com.google.android.gm");
                },
                child: const Text("Open Settings")
              )
            ],
          ),
        )
      ),
    );
  }
}
