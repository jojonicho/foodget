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
import 'package:foodget/models/models.dart';
import 'package:foodget/screens/login_screen.dart';
import 'package:foodget/services/auth.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(user: user);
}

class _HomeScreenState extends State<HomeScreen> {
  final User user;

  _HomeScreenState({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [Colors.blue[100], Colors.blue[400]],
        //   ),
        // ),
        child: 
        // FutureBuilder<User>(
        //     future: user,
        //     builder: (context, snapshot) {
        //       if (!snapshot.hasData) {
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //       final user = snapshot.data;
        //       return 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.photoUrl,
                          ),
                          radius: 25,
                          backgroundColor: Colors.transparent,
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                user.displayName,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        OutlineButton(
                          onPressed: () {
                            signOutGoogle();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }), ModalRoute.withName('/'));
                          },
                          splashColor: Colors.indigo,
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
                                    height: 18.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )

                        // RaisedButton(
                        //   onPressed: () {
                        //     signOutGoogle();
                        //     Navigator.of(context).pushAndRemoveUntil(
                        //         MaterialPageRoute(builder: (context) {
                        //       return LoginScreen();
                        //     }), ModalRoute.withName('/'));
                        //   },
                        //   color: Colors.indigo,
                        //   child: Text(
                        //     'Sign Out',
                        //     style: TextStyle(fontSize: 10, color: Colors.white),
                        //   ),
                        //   elevation: 5,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(50)),
                        //       // padding: EdgeInsets.all(1),
                        //       // hoverColor: Colors.red,
                        // )
                      ],
                    ),
                    SizedBox(height: 40),
                    // SizedBox(height: 20),
                    // Text(
                    //   'EMAIL',
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.black54),
                    // ),
                    // Text(
                    //   user.email,
                    //   style: TextStyle(
                    //       fontSize: 25,
                    //       color: Colors.deepPurple,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 40),
                  ],
                )),
              )
      ),
    );
  }
}
