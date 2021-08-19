import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Email'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Row(children: [Text('모모에게 보낸 메일')],),
          Row(children: [Text('사나에게 보낸 메일')],),
          Row(children: [Text('쯔위에게 보낸 메일')],),
        ],
      ),
    );
  }
}