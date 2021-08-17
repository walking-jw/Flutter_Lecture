import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/send');
            }, 
            icon: Icon(Icons.mail)),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/receive');
            }, 
            icon: Icon(Icons.add_box)),
        ], 
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: (){
               Navigator.pushNamed(context, '/send');
              }, 
              child: Text('Send Email')
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/receive');
              }, 
              child: Text('Receive Email')
            ),
          ],
        ),
      ),
    );
  }

}