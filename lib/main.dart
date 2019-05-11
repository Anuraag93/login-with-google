import 'package:demo_flutter/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<UserEntity> users;
  @override
  void initState() {
    users = [UserEntity(id: '1', name: "A", )];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _buildContacts(),
        ),
      ),
    );
  }

  List<Widget> _buildContacts() {
    List<Widget> list = [];
    for (var i = 0; i < 25; i++) {
      list.add(StickyHeader(
          header: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20, 10, 5, 5),
              child: Text("A")),
          content: Column(children: _buildSomeItems("A"))));
    }
    return list;
  }

  List<Widget> _buildSomeItems(String item) {
    List<Widget> l = [];

    for (var i = 0; i < 5; i++) {
      l.add(ListTile(
        leading: CircleAvatar(child: Text("A")),

      ));
    }
    return l;
  }
}
