import 'package:flutter/material.dart';
import 'package:guess_teacher_age/pages/guess.dart';
import 'package:guess_teacher_age/pages/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      // home: LoginPage(),
      routes: {
        GuessAge.routeName : (context) => const GuessAge(),
        ResultPage.routeName: (context) => const ResultPage(),
       },
      initialRoute: GuessAge.routeName,
    );
  }
}
