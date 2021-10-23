import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/result';

  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var age = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.3),
        title:  Text("GUESS TEACHER'S AGE"),

      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'อายุอาจารย์',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800,
                ),
              ),
              Text(
                '${age['year']} ปี ${age['month']} เดือน',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800,
                ),
              ),
              Icon(
                Icons.check,
                size: 100,
                color: Colors.teal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}