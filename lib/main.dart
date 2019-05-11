import 'package:demo_flutter/custom_circle_avatar.dart';
import 'package:demo_flutter/model/user_entity.dart';
import 'package:demo_flutter/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

void main() => runApp(MyApp());

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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = UserBloc();
  ScrollController _controller;

  List<UserEntity> users = [];

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Contacts"),
      ),
      body: StreamBuilder<List<UserEntity>>(
          stream: _bloc.userList,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data.isNotEmpty) {
              return ListView(
                controller: _controller,
                itemExtent: 80,
                semanticChildCount: snapshot.data.length,
                children: _buildContacts(snapshot.data),
              );
            } else {
              return Center(
                child: Text("No Contacts Available"),
              );
            }
          }),
    );
  }

  List<Widget> _buildContacts(List<UserEntity> data) {
    List<Widget> list = [];
    List<Widget> charList = [];

    String previousLetter = "";
    data.map((f) {
      final initial = f.fullName.substring(0, 1).toUpperCase();
      if (previousLetter.isEmpty || initial == previousLetter) {
        charList.add(ListTile(
          leading: CustomCircleAvatar(name: f.fullName, imageUrl: f.profilePic),
          title: Text(f.fullName),
        ));
      } else {
        previousLetter = initial;
        list.add(StickyHeader(
            header: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 10, 5, 5),
                child: Text(initial)),
            content: Column(children: charList)));
      }
    }).toList();

    return list;
  }
}
