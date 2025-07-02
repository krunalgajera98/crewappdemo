import 'dart:developer';

import 'package:appcrewdemo/crewappdemo/core/utils/functions/app_function.dart';
import 'package:appcrewdemo/crewappdemo/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Method 1
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User?> signIn(String email, String password) {
    return dataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() {
    return dataSource.signOut();
  }

  @override
  User? getCurrentUser() {
    return dataSource.getCurrentUser();
  }
}

class FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}

/// Method 2

class FireBaseAuthentication {
  static final FireBaseAuthentication instance = FireBaseAuthentication.init();

  factory FireBaseAuthentication() => instance;

  FireBaseAuthentication.init();

  static final FirebaseAuth auth = FirebaseAuth.instance;

  //////////////     Login Email      /////////////////////

  static Future<UserCredential> signInWithEmail({String? email, String? password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email ?? '',
        password: password ?? '',
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        AppFunction.snackBar(type: 'Error!', message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        AppFunction.snackBar(type: 'Error!', message: 'wrong-password');
        log('Wrong password provided for that user.');
      } else {
        AppFunction.snackBar(type: 'Error!', message: e.message.toString());
      }
      throw '';
    }
  }

  static Future<UserCredential> registerWithEmail({String? email, String? password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  //////////////     LogOut      /////////////////////

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
