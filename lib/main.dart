import 'package:flutter/material.dart';
import 'package:gramme/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gramme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          headline6: TextStyle(
            fontSize: 36.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Roboto',
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: const HomeScreen(title: 'Gramme'),
    );
  }
}
