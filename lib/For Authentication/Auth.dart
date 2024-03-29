// ignore_for_file: unused_element, non_constant_identifier_names, unused_field, unnecessary_null_comparison, empty_catches, avoid_print, unused_local_variable

import 'package:ethyummy/Firebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Auth Models/auth_class.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users? _FromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users?> get UserDetails {
    return _auth.authStateChanges().map(_FromFirebaseUser);
  }

  Future RegisterTHroughEmail(String Email, String Password) async {
    try {
      UserCredential Result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      User? users = Result.user;
      await DatabaseService(uid: users!.uid).UpdateUserData(
        100,
        'Etherium',
        100,
        '100',
        100,
        100,
      );
      return _FromFirebaseUser(users);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future LogInThroughEmail(String Email, String Password) async {
    try {
      UserCredential Result = await _auth.signInWithEmailAndPassword(
          email: Email, password: Password);
      User? users = Result.user;

      return _FromFirebaseUser(users);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future LogOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
