import 'package:flutter/material.dart';
import 'package:foodget/models/models.dart';

import 'logout_button.dart';

class UserView extends StatelessWidget {
  const UserView({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
            user.photoUrl,
          ),
          radius: 22,
          backgroundColor: Colors.transparent,
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.displayName.split(" ")[0],
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        LogoutButton(),
      ],
    );
  }
}