import 'package:flutter/material.dart';

class Screen1st extends StatelessWidget {
  const Screen1st({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1st'),
      ),
      body: Center(
        child: Text('1st'),
      ),
    );
  }
}