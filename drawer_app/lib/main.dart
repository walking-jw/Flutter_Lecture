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
        title: Text('Drawer'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              print("Shopping cart is clicked");
            }, 
            icon: Icon(Icons.shopping_cart)),
        ],
      ),
      // App Bar도 Body도 아닌 다른 화면
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pika01.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                backgroundImage: AssetImage('images/pika02.png'),
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/pika03.png'),
                backgroundColor: Colors.white,
              ),
              ],
              accountName: Text('Pikachu'), 
              accountEmail: Text('pikachu@naver.com'),
              onDetailsPressed: (){
                print("Main page is Clicked");
              },
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            // 여기서부터 Header가 아님
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.black
              ),
              title: Text('Home'),
              onTap: (){
                // Click Listener
                print('Home is Clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,
              color: Colors.black
              ),
              title: Text('설정'),
              onTap: (){
                // Click Listener
                print('Setting is Clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.pages,
              color: Colors.black
              ),
              title: Text('자주 묻는 질문'),
              onTap: (){
                // Click Listener
                print('Question is Clicked');
              },
            )
          ],
        ),
      ),
    );
  }
}

// 시작하기 전에 Emul을 띄워두고 하면 좋다.
// Flutter는 위젯이 기본적으로 세팅되어있다.