
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contextP) {
    return MaterialApp(
        home: SplashScreen(),
        routes: <String, WidgetBuilder> {
    '/home' : (BuildContext context) => new HomeScreen(),
  },
        );
  }
}