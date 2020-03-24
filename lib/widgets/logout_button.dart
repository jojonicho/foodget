import 'package:flutter/material.dart';
import 'package:foodget/screens/login_screen.dart';
import 'package:foodget/services/auth.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        signOutGoogle();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }), ModalRoute.withName('/'));
      },
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/google_logo.png"),
                height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}