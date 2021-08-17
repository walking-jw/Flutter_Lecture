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
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Bar'),
      ),
      body: MySnackBar(),
    );
  }
}

// 다른 클라스 만들어서 body 구성하기
class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 원래 body 바로 뒤부터 작성했던 것을 여기서 쓴다.
    return Center(
      child: ElevatedButton(
        onPressed: (){
          // Button Action * * * * * 
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Elevated Button is Clicked"), // SnackBar 내용
              duration: Duration(seconds: 5),              // 1초동안 띄우기
              backgroundColor: Colors.red,                 // Snack Bar Color
              ));
        },
        child: Text('Snackbar Button'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue)
        ),
      ),
    );
  }
}