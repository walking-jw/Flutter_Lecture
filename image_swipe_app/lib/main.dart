import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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
  // 전역변수
  List<String> imageName = [
    'flower_01.png',
    'flower_02.png',
    'flower_03.png',
    'flower_04.png',
    'flower_05.png',
    'flower_06.png',
    ];

    // swipe 를 위한 값
    int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Image Swiping'),
      ),
      body: Center(
        child: SimpleGestureDetector(
          onHorizontalSwipe: _onHorizontalSwipe,
          onVerticalSwipe: _onHorizontalSwipe,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(imageName[currentImage]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  // 배열이라 중괄호가 들어가야한다.
                  'images/${imageName[currentImage]}',
                  width: 350.0,
                  height: 600.0,
        
                ),
              )
            ],
          ),
        ),
      )
    );
  }


void _onHorizontalSwipe(SwipeDirection direction){
  // 이미지를 바꿔줘야하기때문에 setState
  setState(() {
    if (direction == SwipeDirection.left) {
      print('left');
      currentImage += 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    }
    else {
      print('Right');
      currentImage -= 1;
      if (currentImage < 0) {
        currentImage = imageName.length -1;
      }

    }
  });
}

}
