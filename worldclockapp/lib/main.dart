import 'package:flutter/material.dart';
import 'view/screen/home_screen.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
   mainContext.config = mainContext.config.clone(
    isSpyEnabled: true,
  );

  mainContext.spy(print);
  
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
