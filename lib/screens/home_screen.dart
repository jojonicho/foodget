
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(color: Colors.blue[100]),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodget/screens/login_screen.dart';
import 'package:foodget/services/auth.dart';
class HomeScreen extends StatefulWidget {
  final Future<FirebaseUser> user;
  HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(user: user);
}


class _HomeScreenState extends State<HomeScreen> {
  Future<FirebaseUser> user;

  _HomeScreenState({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: FutureBuilder<FirebaseUser>(
          future: user,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),
              );
            }
            final user = snapshot.data;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.photoUrl,
                    ),
                    radius: 60,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'NAME',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    user.displayName,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'EMAIL',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  RaisedButton(
                    onPressed: () {
                      signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginScreen();}), ModalRoute.withName('/'));
                    },
                    color: Colors.deepPurple,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}