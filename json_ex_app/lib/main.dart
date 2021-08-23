import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for JSON

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  // 전역변수
  String result = '';
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
        title: Text('JSON Image Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: data.length == 0
                ? Text('No Data',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                )
                : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    return Card(
                      child: Container(
                        child: Row(
                          children: [
                            Image.network(
                              data[index]['image'],
                              height: 150,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              '${data[index]['title']}',
                              style: TextStyle(fontSize: 20, 
                              color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                  ),
            ),
          ],
        ),
      ),
      
    );
  }

  Future<String> getJSONData() async{
    var url = Uri.parse('http://localhost:8080/Flutter/movies.json');
    var response = await http.get(url);
    // print(response.body);

    setState(() {
      // utd8 decode
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results']; 
      data.addAll(result);
      print(result);
    });

    return 'default';
  }

}