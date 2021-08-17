import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/mail.dart';
import 'package:navigator_appbar_ex_app/receivemail.dart';
import 'package:navigator_appbar_ex_app/sendemail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return Mail();
        },
        '/send': (context) {
          return SendMail();
        },
        '/receive': (context) {
          return ReceiveMail();
        }
      },
    );
  }
}



