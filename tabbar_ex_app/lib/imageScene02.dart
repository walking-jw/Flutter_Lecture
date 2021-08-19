import 'package:flutter/material.dart';

class ImageScene02 extends StatelessWidget {
  const ImageScene02({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(backgroundImage: AssetImage('images/flower_01.png'), radius: 50.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(backgroundImage: AssetImage('images/flower_02.png'), radius: 50.0,
                  ),
                ),
                Padding(      
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(backgroundImage: AssetImage('images/flower_03.png'), radius: 50.0,
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}