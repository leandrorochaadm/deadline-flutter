import 'package:deadline/ui/pages/home/home_controler.dart';
import 'package:deadline/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dead Line Time',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 26),
          )),
      home: HomePage(controler: HomeControler()),
    );
  }
}
