import 'package:chat_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiCalls {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _userfromFirebaseUser(var user) {
    return user != null ? MyUser(user) : null;
  }

  Future signInWithEmailandPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final firebaseUser = result.user;
      print('firebase user is : ${firebaseUser}');
      return _userfromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e);
    }
  }

  Future signUpWithEmailandPassword(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final firebaseUser = result.user;
      return _userfromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
