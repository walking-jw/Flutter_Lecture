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
        title: Text('App Bar Icon'),
        leading: IconButton(
          onPressed: (){
            print('Menu Button is Clicked');
          },
          icon: Icon(Icons.menu)),     // Hamburger = Menu
          actions: [    // 배열이라 여러개 넣어도 괜찮음
            IconButton(
              onPressed: (){
                print('Email Button is Clicked');
              },
              icon: Icon(Icons.email)),
            IconButton(
              onPressed: (){
                print('Alarm Button is Clicked');
              },
              icon: Icon(Icons.add_alarm)),
            GestureDetector(
              onTap: () {
                print("icon Clicked");
              },
              child: Image.asset(
                'images/flutter.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
      ),
    );
  }
}