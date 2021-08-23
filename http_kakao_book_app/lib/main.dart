import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String search = '';
  String result = '';
  int page = 1;
  late List data;
  late ScrollController _scrollController;
  late TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    data = [];
    _editingController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      //리스트의 마지막일 경우  ( 이것을 하는 이유 = 카카오는 처음에 10개만 준다! )
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        print("bottom");
        page++;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: TextField(
          controller: _editingController,
          decoration: InputDecoration(hintText: "검색"),
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: data.length == 0
              ? Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Row(
                          children: [
                            Image.network(
                              data[index]['thumbnail'].length == ''
                                  ? ''
                                  : data[index]['thumbnail'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.contain,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index]['title'].length < 26
                                      ? data[index]['title']
                                      : data[index]['title']
                                          .toString()
                                          .replaceRange(
                                              26,
                                              data[index]['title']
                                                  .toString()
                                                  .length,
                                              '...'),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data[index]['authors'][0],
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  data[index]['sale_price'].toString(),
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  data[index]['status'],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                  controller: _scrollController,  // 이게 없으면 Event가 발생이 안된다.
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          page = 1;
          data.clear();
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    search = _editingController.text.toString();
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController.value.text}');
    var response = await http.get(url,
        headers: {"Authorization": "KakaoAK 5b69344978bfa5e85524c5df04294b81"});
    setState(() {
      var dataConvertedJSON =
          json.decode(utf8.decode(response.bodyBytes)); // 한글관련 utf8로 decode
      List result = dataConvertedJSON['documents'];
      data.addAll(result);
      print(result);
    });
    return 'Success';
  }
}