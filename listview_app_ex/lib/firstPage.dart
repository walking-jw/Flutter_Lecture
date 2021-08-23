import 'package:flutter/material.dart';
import 'package:listview_app/animalItem.dart';

class FirstPage extends StatelessWidget {
  // 
  final List<Animal> list;
  const FirstPage({ Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, position){
            return GestureDetector(
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      list[position].imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text(list[position].animalName)
                  ],
                ),
              ),
              onTap: (){
                // Action 은 여기서 줘야한다.
                // 정말 다이얼로그만 띄워주는 애기 떄문에 정보를 다 건네줘야함.
                _showDialog(context, list[position].kind, list[position].animalName);
              },
            );
          },
          // item count 를 줘야함
          itemCount: list.length,
          ),
      ),
    );
  }

  void _showDialog(BuildContext context, String kind, String name){

    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('$name'),
          content: Text('이 동물은 $kind 입니다.'),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('종료')),
          ],
      );
    });

  }




}