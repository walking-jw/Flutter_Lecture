import 'package:flutter/material.dart';

class ReceiveMail extends StatelessWidget {
  const ReceiveMail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive Email'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Row(children: [Text('모모에게 받은 메일')],),
          Row(children: [Text('사나에게 받은 메일')],),
          Row(children: [Text('쯔위에게 받은 메일')],),
        ],
      ),
    );
  }
}