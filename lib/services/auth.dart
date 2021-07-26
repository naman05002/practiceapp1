import 'package:firebase_auth/firebase_auth.dart';
import 'package:practiceapp/models/User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserClass? _userFromFirebaseUser(User? user) {
    return user != null ? UserClass(uid: user.uid) : null;
  }

  //sign in anon
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email and password

  //register with email & password

  // sign out

}
