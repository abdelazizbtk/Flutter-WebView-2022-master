import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          WebView(
            initialUrl: 'https://app.ilovebrescia.it/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            onPageStarted: (url) {
              print('page Started : $url');
              Future.delayed(const Duration(milliseconds: 1000), () {
                setState(() {
                  isLoading = false;
                });
              });
            },
            onPageFinished: (url) {
              print('finished');
            },
          ),
          if (isLoading)
            const Center(
              child: SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    ));
  }
}
