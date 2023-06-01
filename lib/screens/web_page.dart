import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utilities/appbar.dart';

class WebPage extends StatefulWidget {
  final String blogUrl;
  const WebPage({Key? key, required this.blogUrl}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  double loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // log("value $loadingPercentage");
    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      appBar: appbar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WebView(
              initialUrl: widget.blogUrl,
              onPageStarted: (url) {
                setState(() {
                  loadingPercentage = 0;
                });
              },
              onProgress: (progress) {
                // log("on progress called");
                setState(() {
                  loadingPercentage = progress.toDouble();
                });
              },
              onPageFinished: (url) {
                setState(() {
                  loadingPercentage = 100;
                });
              },
              onWebViewCreated: (WebViewController webViewController) {
                _completer.complete(webViewController);
              },
            ),
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100,
            ),
        ],
      ),
    );
  }
}
