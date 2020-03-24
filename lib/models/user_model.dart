// import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class User {
  final String id;
  final String displayName;
  final String email;
  final String photoUrl;

  const User({
    @required this.id,
    @required this.displayName, 
    @required this.email, 
    @required this.photoUrl});
}