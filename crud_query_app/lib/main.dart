import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for JSON

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
  String result = '';  // 결과값 받는
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Test'),
      ),
      body: Container(  // 기종 상관없이 휴대폰 꽉 채워줌
        child: Center(
          child: data.length == 0   // 위젯에 유일하게 삼항연산자 쓸 수 있다.
            ? Text(
              '데이터가 없습니다.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
            : ListView.builder(
              itemBuilder: (context, index){
                return Card(  // 데이터 있으면 모양만들기
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Code :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data[index]['code'].toString()),  // 데이터 받아오기
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Name :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data[index]['name'].toString()),  // 데이터 받아오기
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Dept :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data[index]['dept'].toString()),  // 데이터 받아오기
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Phone :",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data[index]['phone'].toString()),  // 데이터 받아오기
                          ],
                        ),
                      )
                    ],
                  )
                );
              },
              itemCount: data.length,
              ),
          
        ),
      ),
    );
  }

  // 안쪽에 쓰는 이유 = setState 사용하기 위해
  Future<String> getJSONData() async{
    var url = Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    // print(response.body);

    setState(() {
      var dataConvertedJSON = json.decode(response.body); // decode 하면 Key값과 Value 값만 남는다.
      List result = dataConvertedJSON['results']; // results 안에 있는 코드 가져오기
      print(result);

      data.addAll(result);   // for문으로 넣는게 아니라 한번에 다들어감

    });
    return 'a'; // null 값이 불가능해서 임의값 줌
  }


}