import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController t1 = new TextEditingController(text: "");
  final TextEditingController t2 = new TextEditingController(text: "");

  void binary(String text){
    t2.text = (text == "") ? "" : int.parse(text,radix: 2).toString();
  }
  void decimal(String text){
   t1.text = (text == "") ? "" : int.parse(text).toRadixString(2);
  }

  void clear(){
    t1.text = "";
    t2.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Bin2Dec",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                labelText: "Binary",
                labelStyle: TextStyle(fontSize: 30,color: Colors.deepPurple,fontWeight: FontWeight.bold),
              ) ,
              controller: t1,
              keyboardType: TextInputType.number,
              onChanged: binary,
            ),
            new TextField(
              decoration: new InputDecoration(
                labelText: "Decimal",
                labelStyle: TextStyle(fontSize: 30,color: Colors.deepPurple,fontWeight: FontWeight.bold),
              ) ,
              controller: t2,
              keyboardType: TextInputType.number,
              onChanged: decimal,
            ),
            new Padding(padding: const EdgeInsets.only(top: 20)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  child:
                  new Text("CLEAR",style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                  onPressed: clear ,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}