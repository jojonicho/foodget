// import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class User {
  final String displayName;
  final String email;
  final String photoUrl;

  const User({
    @required this.displayName, 
    @required this.email, 
    @required this.photoUrl});
}