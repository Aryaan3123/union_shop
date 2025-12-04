import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

// Enum to represent authentication results
enum AuthState { 
  inital, // App just started
  loading, // Authenticating...
  authenticaed, // User is logged in
  unauthenticated // User is not logged in
  }
