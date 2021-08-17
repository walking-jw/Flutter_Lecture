import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snack Bar"),
      ),
      body: MySnackBar(), // 함수로 호출
    );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // 함수이기 때문에 ,말고 ;붙임
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ElevatedButton is clicked"),
              duration: Duration(seconds: 1), // 띄울 시간
              backgroundColor: Colors.black38,
            ),
          );
        },
        child: Text("Snackbar Button"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
      ),
    );
  }
}
