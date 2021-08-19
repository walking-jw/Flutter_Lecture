import 'package:flutter/material.dart';
import 'package:tabbar_ex_app/imageScene01.dart';
import 'package:tabbar_ex_app/imageScene02.dart';

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

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
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
        title: Text('Image Tab bar')
      ),
      body: TabBarView(
        children: [ImageScene01(), ImageScene02()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.blueAccent,
        tabs: [
          Tab(
            icon: Icon(
              Icons.lock_clock
            ),
            text: 'Image Scene #1',
          ),
          Tab(
            icon: Icon(
              Icons.account_balance,
              color: Colors.red,
            ),
            text: 'Image Scene #2',
          ),
        ],
        controller: controller,
        ),
    );
  }
}