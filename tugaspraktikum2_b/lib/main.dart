import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String textHolder = 'Harvian Arga Adi Putra';

  void tekantombol() {
    setState(() {
      textHolder = 'Carlitos Demante Libunante';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 180, 205, 247),
        appBar: AppBar(
          title: Text(" Ganti Nama "),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 1, 30, 51),
                    Color.fromARGB(255, 98, 0, 255)
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: tekantombol,
                child: Text("cuman tombol"),
              ),
              Text(
                textHolder,
                style: TextStyle(fontSize: 21),
              )
            ],
          ),
        ),
      ),
    );
  }
}
