import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final String selectedUrl;

  MyWebView({
    @required this.selectedUrl,
  });

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        print("paused");
        break;
      case AppLifecycleState.inactive:
        print("paused");
        break;
      case AppLifecycleState.resumed:
        print("paused");
        Navigator.of(context).pop();
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        break;
      default:
    }
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Future<bool> _onWillPop() async {
    return (await dialog()) ?? false;
  }

  dialog() {
    print('im called');
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Apakah anda yakin untuk keluar? "),
            content: Text(
                "Anda tidak dapat melanjutkan test setelah keluar aplikasi"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Tidak"),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  SystemChrome.setEnabledSystemUIOverlays(
                      SystemUiOverlay.values); // bring back the status bar
                },
                child: Text(
                  "Iya",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        []); // fulscreen (remove status and navbar)
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: WebView(
        initialUrl: widget.selectedUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      )),
    );
  }
}
