import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Real-time auth state stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Current user getters
  User? get currentUser => _auth.currentUser;
  bool get isLoggedIn => currentUser != null;

  // Sign up new user
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      // Create Firebase Auth account
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        // Update display name in Firebase Auth
        await result.user!.updateDisplayName(displayName);

        // Create your UserModel
        final userModel = UserModel.fromAuthUser(result.user!, displayName);

        // Save to Firestore
        await _createUserDocument(userModel);

        return AuthResult.success(result.user!);
      }

      return AuthResult.failure('Failed to create user account');
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors
      return AuthResult.failure(_getAuthErrorMessage(e));
    } catch (e) {
      // Unexpected errors
      return AuthResult.failure('Unexpected error: $e');
    }
  }

  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        // Update lastLoginAt in Firestore
        await _updateLastLogin(result.user!.uid);
        return AuthResult.success(result.user!);
      }

      return AuthResult.failure('Failed to sign in');
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_getAuthErrorMessage(e));
    } catch (e) {
      return AuthResult.failure('Unexpected error: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Reset password
  Future<AuthResult> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return AuthResult.success(null, message: 'Password reset email sent');
    } on FirebaseAuthException catch (e) {
      return AuthResult.failure(_getAuthErrorMessage(e));
    }
  }

  // Get User document from firestore
  Future<UserModel?> getUserDocument(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromFirestore(doc);
      }
    } catch (e) {
      print('Error getting user document: $e');
    }
    return null;
  }
}
