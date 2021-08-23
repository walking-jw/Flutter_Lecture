import 'package:flutter/material.dart';
import 'package:listview_app/flagItem.dart';

class SecondPage extends StatelessWidget {

  final List<Flag> list;

  const SecondPage({ Key? key, required this.list }) : super(key: key);

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
                    Text('${list[position].countryName[0]}______')
                  ],
                ),
              ),
              onTap: (){
                _showDialog(context, list[position].imagePath, list[position].countryName);
              },
            );
          },
          itemCount: list.length,
          ),
      ),
    );
  }

  void _showDialog(BuildContext context, String imagePath, String countryName){

    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('$countryName'),
          content: Text('이 국가는 $countryName의 국기 입니다.'),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
              ),
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('종료'))
          ],
        );
      });

  }



}