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
      debugShowCheckedModeBanner: false,
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
        title: Text('영웅 Card'),
        backgroundColor: Colors.red[300],
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(backgroundImage: AssetImage('images/HeroLee.jpeg'),radius: 50.0,),
            Divider(
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5,
            ),
            Column(
              children: [
              Text('성웅'),
              Text('이순신 장군'),
              Text('전적'),
              Text('62전 62승'),
              Row(children: [
                
              ],),
              ],
            ),
          ],
        ),
      ),
    );
  }
}