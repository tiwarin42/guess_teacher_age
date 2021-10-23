import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:guess_teacher_age/services/api.dart';


class GuessAge extends StatefulWidget {
  static const routeName = '/guessage';

  const GuessAge({Key? key}) : super(key: key);

  @override
  _GuessAgeState createState() => _GuessAgeState();
}

class _GuessAgeState extends State<GuessAge> {
  int year = 0;
  int month = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title:  Text("GUESS TEACHER'S AGE",),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'อายุอาจารย์',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    border: new Border.all(
                        color: Colors.teal.shade500,
                        width: 5.0,
                        style: BorderStyle.solid),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpinBox(
                        decoration: InputDecoration(labelText: 'ปี'),
                        min: 1,
                        max: 100,
                        value: 0,
                        textStyle: TextStyle(fontSize: 40),
                        onChanged: (value) {
                          year = value.toInt();
                          print(year);
                        },
                      ),
                      SpinBox(
                        decoration: InputDecoration(labelText: 'เดือน'),
                        min: 1,
                        max: 12,
                        value: 0,
                        textStyle: TextStyle(fontSize: 40),
                        onChanged: (value) {
                          month = value.toInt();
                          print(month);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow.shade800,
                            ),
                            onPressed: _handleClickButton,
                            child: Text(
                              'ทาย',
                              style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          elevation: 5,
          backgroundColor: Colors.teal.shade100,
          title: Text(title, style:TextStyle(
              fontSize: 30,
              color: Colors.teal),),
          content: Text(msg,  style: TextStyle(
              fontSize: 20,

              color: Colors.white),),
          actions: [
            TextButton(
              child: Text('OK',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.teal.shade800,
                  )),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _handleClickButton() async {
    var guest = await _login(year, month);

    if (guest['value'] == true) {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: {'year': year,'month': month},
      );
    } else {
      _showMaterialDialog('ผลการทาย', '${guest['text']}');
    }
  }

  Future<dynamic> _login(int y, int m) async {
    try {
      var isLogin =
      (await Api().submit('guess_teacher_age', {'year': y, 'month': m}));
      print('LOGIN: $isLogin');
      return isLogin;
    } catch (e) {
      print(e);
      _showMaterialDialog('ERROR', e.toString());
      return null;
    }
  }
}