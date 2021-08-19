import 'package:drawer_ex_app/receivemail.dart';
import 'package:drawer_ex_app/sendemail.dart';
import 'package:flutter/material.dart';

import 'mail.dart';

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
