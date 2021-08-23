import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context){
          
        }

      },

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
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  String id = 'user00';
  String pw = 'qwer1234';

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircleAvatar(backgroundImage: AssetImage('images/login.png'),radius: 50.0,),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: true,
              ),
            ),
            ElevatedButton(onPressed: (){
              loginCheck(context);
            }, child: Text('Log in')),
          ],
        ),
      ),

    );
  }


  void loginCheck(BuildContext context) {

    if (nameController.text.isEmpty || passwordController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('사용자 ID와 비밀번호를 입력하세요'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          )
      );
    } else{

      if (nameController.text != id || passwordController.text != pw) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('사용자 ID와 비밀번호가 일치하지 않습니다'),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.blue,
            )
          );
      } else{

          AlertDialog dialog = AlertDialog(
            title: Text('환영합니다!'),
            content: Text('신분이 확인 되었습니다.'),
              );
          showDialog(
            context: context,
            builder: (BuildContext context){
              return dialog;
          });
        }// if

    } // else
    
   

  }




}