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
              leading: Icon(Icons.mail,
              color: Colors.black
              ),
              title: Text('보낸 편지함'),
              onTap: (){
                Navigator.pushNamed(context, '/send');
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_outline,
              color: Colors.black
              ),
              title: Text('받은 편지함'),
              onTap: (){
                Navigator.pushNamed(context, '/receive');
             
              },
            ),
          ],
        ),
      ),
    );
  }

}