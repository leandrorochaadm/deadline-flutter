import 'package:deadline/ui/pages/home/home_page.dart';
import 'package:deadline/ui/pages/life/life_controller.dart';
import 'package:deadline/ui/pages/life/life_page.dart';
import 'package:flutter/material.dart';

import 'ui/pages/year/year.dart';

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
      routes: {
        '/year': (context) => YearPage(controller: YearController()),
        '/life': (context) => LifePage(controller: LifeController()),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 26),
          )),
      home: const HomePage(),
    );
  }
}
