import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Enum to represent authentication results
enum AuthState {
  initial, // App just started
  loading, // Authenticating...
  authenticated, // User is logged in
  unauthenticated // User is not logged in
}

class AuthProvider extends ChangeNotifier {
  // dependencies
  final AuthService _authService = AuthService();

  // Private state variables
  AuthState _authState = AuthState.initial;
  User? _firebaseUser;
  UserModel? _userModel;
  String? _errorMessage;
  // Public getters for the UI components
  AuthState get state => _authState;
  User? get firebaseUser => _firebaseUser;
  UserModel? get userModel => _userModel;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _firebaseUser != null;
  bool get isLoading => _authState == AuthState.loading;
  String get userDisplayName => _userModel?.displayName ?? 'User';

  AuthProvider() {
    // Listen to auth state changes
    _initAuthListener();
  }

  void _initAuthListener() {
    // Listen to your AuthService's auth state stream
    _authService.authStateChanges.listen((User? user) async {
      print('Auth state changed: ${user?.email ?? 'No user'}');

      _firebaseUser = user;

      if (user != null) {
        // User logged in - fetch their extended data from Firestore
        print('Fetching user document for: ${user.uid}');
        _userModel = await _authService.getUserDocument(user.uid);
        _authState = AuthState.authenticated;
        print('User authenticated: ${_userModel?.displayName}');
      } else {
        // User logged out - clear all data
        print('User signed out');
        _userModel = null;
        _authState = AuthState.unauthenticated;
      }

      // Clear any previous errors when auth state changes
      _errorMessage = null;

      // Notify all listening widgets that state has changed
      notifyListeners();
    });
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    print('Starting signup for: $email');

    // Helper method to handle loading states and errors
    return _handleAuthOperation(() async {
      // Call AuthService to sign up
      final result = await _authService.signUp(
        email: email,
        password: password,
        displayName: displayName,
      );

      if (!result.success) {
        _errorMessage = result.error;
        print('Signup failed: ${result.error}');
        return false;
      }

      print('Sign successful for: $email');
      return true;
    });
  }

  // Sign in as existing user
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    print('Starting sign-in for: $email');

    return _handleAuthOperation(() async {
      // Call AuthService to sign in
      final result = await _authService.signIn(
        email: email,
        password: password,
      );

      if (!result.success) {
        _errorMessage = result.error;
        print('Sign-in failed: ${result.error}');
        return false;
      }

      print('Sign-in successful for: $email');
      return true;
    });
  }

  // Sign out current user
  Future<void> signOut() async {
    print('Signing out user: ${_firebaseUser?.email}');
    _authState = AuthState.loading;
    notifyListeners();

    try {
      // Call your AuthService
      await _authService.signOut();
      print('Signout successful');
    } catch (e) {
      print('Signout error: $e');
      _errorMessage = 'Failed to sign out';
      // Reset state since signout failed
      _authState = _firebaseUser != null
          ? AuthState.authenticated
          : AuthState.unauthenticated;
      notifyListeners();
    }
  }

  // Reset password for given email
  Future<bool> resetPassword(String email) async {
    print('Requesting password reset for: $email');

    return _handleAuthOperation(() async {
      final result = await _authService.resetPassword(email);

      if (!result.success) {
        _errorMessage = result.error;
        return false;
      }

      // For password reset, I want to show the success message
      _errorMessage = result.message;
      return true;
    });
  }

  Future<bool> _handleAuthOperation(Future<bool> Function() operation) async {
    _authState = AuthState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await operation();
      return result;
    } catch (e) {
      print('Unexpected auth error: $e');
      _errorMessage = 'An unexpected error occurred';
      return false;
    } finally {
      if (_authState == AuthState.loading) {
        _authState = _firebaseUser != null
            ? AuthState.authenticated
            : AuthState.unauthenticated;
        notifyListeners();
      }
    }
  }
}
