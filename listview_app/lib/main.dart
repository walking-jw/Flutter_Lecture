import 'package:flutter/material.dart';
import 'package:listview_app/firstPage.dart';
import 'package:listview_app/flagItem.dart';
import 'package:listview_app/secondPage.dart';
import 'package:listview_app/animalItem.dart';

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

class _MyHomePageState extends State<MyHomePage> 
with SingleTickerProviderStateMixin{

  List<Animal> animalList = [];
  List<Flag> flagList = [];
  late TabController controller;
  
  @override
  void initState() {
    super.initState();
    // 탭이 2개짜리다 라는 의미
    controller = TabController(length:  2, vsync: this);

    animalList.add(Animal(
      animalName: '고양이',
      kind: '포유류',
      imagePath: 'images/cat.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '강아지',
      kind: '포유류',
      imagePath: 'images/dog.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '여우',
      kind: '포유류',
      imagePath: 'images/fox.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '원숭이',
      kind: '영장류',
      imagePath: 'images/monkey.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '돼지',
      kind: '포유류',
      imagePath: 'images/pig.png',
      flyExist: false
    ));

    flagList.add(Flag(
      countryName: '오스트리아',
      imagePath: 'images/austria.png'
    ));
    flagList.add(Flag(
      countryName: '중국',
      imagePath: 'images/china.png'
    ));
     flagList.add(Flag(
      countryName: '미국',
      imagePath: 'images/america.png'
    ));
     flagList.add(Flag(
      countryName: '프랑스',
      imagePath: 'images/france.png'
    ));
    flagList.add(Flag(
      countryName: '이탈리아',
      imagePath: 'images/italy.png'
    ));
    flagList.add(Flag(
      countryName: '한국',
      imagePath: 'images/korea.png'
    ));
    flagList.add(Flag(
      countryName: '그리스',
      imagePath: 'images/greece.png'
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List view Test'),
      ),
      body: TabBarView(
        children: [FirstPage(
          // list 란 이름으로 animalList 값을 준다.
          list: animalList,
        ), SecondPage(
          list: flagList,
        )],
        controller: controller,
        ),
        bottomNavigationBar: TabBar(
          // 기본은 white
          labelColor: Colors.blueAccent,
          tabs: [
            // Tab Design
            Tab(  // 첫번째 Tab
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
              text: 'Page #1',
            ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
              text: 'Page #2',
          ),
          ],
          // Design + controller 정의
          controller: controller,
          ),
    );
  }
}