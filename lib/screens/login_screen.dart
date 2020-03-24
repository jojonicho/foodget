import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodget/services/auth.dart';
import 'package:foodget/models/models.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlutterLogo(size: 115),
                  Column(
                    children: <Widget>[
                      Text(
                        "oodget",
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.pink,
                            size: 55.0,
                            semanticLabel: 'issa heart',
                          ),
                          Icon(
                            Icons.local_pizza,
                            color: Colors.indigo,
                            size: 55,
                            semanticLabel: 'issa pizza',
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signIn();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  signIn() async{
    User user = await getUser();
    if (user != null) {
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen(user: user);
            },
          ),
        );
    }
  }

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(
            id: user.uid,
            displayName: user.displayName,
            email: user.email,
            photoUrl: user.photoUrl)
        : null;
  }

  Future<User> getUser() async {
    try {
      FirebaseUser user = await signInWithGoogle();
      return _userFromFirebaseUser(user);
    } catch (err) {
      return null;
    }
  }
}
