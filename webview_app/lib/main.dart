import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final Completer<WebViewController> _controller = 
  Completer<WebViewController>();

  TextEditingController searchTextController = TextEditingController();
  bool isLoading = true;    // for indicator
  String siteName = 'https://www.daum.net';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchTextController,
          decoration: InputDecoration(labelText: 'Site이름을 입력하세요'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                siteName = searchTextController.text;
                _controller.future
                .then((value) => value.loadUrl('https://$siteName'));

              });
            },
          )
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: siteName,
            javascriptMode: JavascriptMode.unrestricted,  // JS를 수용하겠다.
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }, // 웹이 켜질때
            onPageFinished: (finish) {  // 로딩 다 되면
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading ? Center(
            child: CircularProgressIndicator(),
          )
          :Stack(),
        ],
      ),

      // Floating Button
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future, 
        builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData){
            return FloatingActionButton(
              child: Icon(Icons.arrow_back),
              backgroundColor: Colors.redAccent,
              onPressed: (){
                // Button Click
                controller.data!.goBack();
              });
          } // if
          return Container();
        }
      ),

    );
  }

  void setWebView(BuildContext context, String url) {
    WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,  // JS Accept
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) { 
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          );
  }


}

