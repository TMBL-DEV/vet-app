import 'package:firebase_auth/firebase_auth.dart';
import 'package:vetApp/models/User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirbaseUser);
  }

  User _userFromFirbaseUser(FirebaseUser user) {
    return user != null
        ? new User(uid: user.uid, userName: user.displayName, email: user.email)
        : null;
  }

  Future signup(String _email, String _password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      FirebaseUser user = result.user;

      return user;
    } catch (error) {
      print(error.code);
      return error.code;
    }
  }

  Future signin(String _email, String _password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      FirebaseUser user = result.user;

      return user;
    } catch (error) {
      print(error.code);
      return error.code;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print(error.code);
    }
  }
}
