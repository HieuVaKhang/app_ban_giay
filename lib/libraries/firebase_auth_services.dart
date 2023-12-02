import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Mật khẩu quá yếu.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          )),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Email đã tồn tại.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          )),
        );
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Tài khoản không tồn tại.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          )),
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Mật khẩu không chính xác.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          )),
        );
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  // Add User Firestore Database
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  Future<void> addUser(String id, String email, String name) {
    return users
        .add({
          'id': id,
          'email': email,
          'fullname': name,
        })
        .then((value) => print('User added'))
        .catchError((error) => print('Failed to add user: $error'));
  }
}
