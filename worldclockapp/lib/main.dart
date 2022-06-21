import 'package:flutter/material.dart';
import 'view/screen/home_screen.dart';
import 'package:mobx/mobx.dart';

void main() {
   mainContext.config = mainContext.config.clone(
    isSpyEnabled: true,
  );

  mainContext.spy(print);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
