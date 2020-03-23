
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async{
  // String name;
  // String email;
  // String imageUrl;
  
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);

  assert(await user.getIdToken() != null);

  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  // name = user.displayName;
  // email = user.email;
  // imageUrl = user.photoUrl;

  final FirebaseUser currentUser = await _auth.currentUser();

  assert(user.uid == currentUser.uid);

    // name = user.displayName;
  // email = user.email;
  // imageUrl = user.photoUrl;  

  return currentUser;
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}