import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http Exercise'),
      ),
      body: Container(
        child: Center(
          child: Text('$result'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var url = Uri.parse('https://www.google.com');
          // uniform resource information = 어디서 받아오는지 알려주는 정보
          var response = await http.get(url); // 다른거 다 실행 하고나서 기다렸다가 실행한다!
          result = response.body;
          // 이상태면 값(state)이 바뀌었기 때문에 setState
          setState(() {
            // setState 에서 쓰는 애들은 전역변수로 미리 써주는게 좋다.
            result = response.body;
          });
        },
        child: Icon(Icons.file_download),
      ),
    );
  }
}
