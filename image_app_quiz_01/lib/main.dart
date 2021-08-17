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
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Text("Image 01"),
        centerTitle: false,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(backgroundImage: AssetImage('images/pika01.png'),radius: 50.0,),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(backgroundImage: AssetImage('images/pika02.png'),radius: 50.0,),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(backgroundImage: AssetImage('images/pika03.png'),radius: 50.0,),
            ),
          ],
        ),
      ),
    );
  }
}