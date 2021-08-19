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

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controller
  TextEditingController textController = TextEditingController();
  // var for Snackbar
  late String inputValue;

  @override
  Widget build(BuildContext context) {
    // Scaffold > Wrap with widget... > GestureDetector
    return GestureDetector(
      onTap: (){
        // 키보드 내리기
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Single Textfield'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                // Controller
                controller: textController,
                decoration: InputDecoration(labelText: '글자를 입력하세요'),
                keyboardType: TextInputType.text,
              ),
    
              // Button
              ElevatedButton(
                onPressed: (){
                  if (textController.text == '' ||
                      textController.text.isEmpty) {
                    errorSnackBar(context);
                  } else {
                    // TextField 에 내용이 있으면? -> Snackbar
                    inputValue = textController.text;
                    showSnackBar(context, inputValue);
                  }
                }, 
                child: Text('출력')),
            ],
          ),
        )
      ),
    );
  }

  // Error Snackbar
  void errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('글자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Show Snackbar
  void showSnackBar(BuildContext context, String inputValue) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('입력한 글자는 $inputValue 입니다'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }

} // End of Main