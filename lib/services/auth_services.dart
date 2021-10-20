import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return response.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> registerWithEmail(
      {required String email, required String password}) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return response.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> passwordReset({required String email}) async {
    String message = '';
    try {
      await _auth.sendPasswordResetEmail(email: email);
      message = 'Reset Link is sent';
    } catch (e) {
      message = e.toString();
    }
    return message;
  }
}
