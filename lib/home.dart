import 'package:flutter/material.dart';
import 'web.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ip = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 40),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  child: Text("ini logo"),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tryout APP",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hey, selamat datang!",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 20),
                  child: Text(
                    "Baris yang kamu baca ini adalah deskripsi dari aplikasi ini",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22.0),
                        topRight: Radius.circular(22.0)),
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.black54,
                          offset: new Offset(0.0, 0.0),
                          blurRadius: 6,
                          spreadRadius: 0.1)
                    ]),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Masukan Ip Address Server untuk memulai, Semangat yaaaa!",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        ),),
                  TextField(
                    decoration: InputDecoration(labelText: "IP Address"),
                    controller: ip,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: MaterialButton(
                      color:Colors.green ,
                      minWidth: double.maxFinite,
                      height: 50,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MyWebView(
                                  selectedUrl: "http://"+ip.text+"/xproject2",
                                )));
                      },
                      child: Text("GO!", style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
                        
                      
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
