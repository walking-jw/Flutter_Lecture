import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        title: Text('Toast'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            toastAction();
          },
          child: Text('Toast Button'),
        ),
      ),
    );
  }

  void toastAction() {
    Fluttertoast.showToast(msg: 'Tasty Toast is now baked');
  }




}