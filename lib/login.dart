import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignInAccount _currentUser;
  String _contactText;

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      // setState(() {
      //   _currentUser = account;
      // });
      if (account != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => GoogleSignin()));
      }
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Google"),
              color: Colors.red,
              onPressed: () {
                _handleSignIn();
              },
            ),
            OutlineButton(
              child: Text("LinkedIn"),
              color: Colors.blue[900],
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Instagram"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class GoogleSignin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
