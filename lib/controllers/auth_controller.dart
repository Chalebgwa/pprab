import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pprab/models/client_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class Auth extends ChangeNotifier {
  Client? currentUser;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentUser = null;
    notifyListeners();
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String businessType,
    required String? companyName,
    required String? idNumber,
    required bool? registeredWithCIPA,
  }) async {
    try {
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // analytics
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> logSignUp() async {
    await analytics.logSignUp(signUpMethod: 'email');
  }

  Future<void> logLogin() async {
    await analytics.logLogin(loginMethod: 'email');
  }

  Future<void> logSignOut() async {
    await analytics.logEvent(name: 'sign_out');
  }

  Future<void> logPageView() async {
    await analytics.logEvent(name: 'page_view');
  }

  Future<void> logSelectContent() async {
    await analytics.logSelectContent(
      contentType: 'page_view',
      itemId: 'page_view',
    );
  }

  Future<void> logShare() async {
    await analytics.logShare(
      contentType: 'page_view',
      itemId: 'page_view',
      method: 'email',
    );
  }

  Future<void> logSearch() async {
    await analytics.logSearch(searchTerm: 'page_view');
  }
}
