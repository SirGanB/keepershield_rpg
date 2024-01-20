import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AuthException extends ChangeNotifier implements Exception {
  final String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? e) {
      user = e;
      isLoading = false;

      notifyListeners();
    });
  }

  void _getUser() {
    user = _auth.currentUser;

    notifyListeners();
  }

  register({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message!);
    }
  }

  login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message!);
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }

  String defineId() {
    String string = '';

    var now = DateTime.now();
    var formattedDate = DateFormat('yyyyMMddHHmmss').format(now);

    string = 'u:${user!.uid}d:$formattedDate';

    return string;
  }
}
