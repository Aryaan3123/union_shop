import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String? photoURL;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  final List<String> favoriteProducts;
  final Map<String, dynamic>? shippingAddress;
  final bool emailVerified;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoURL,
    required this.createdAt,
    this.lastLoginAt,
    this.favoriteProducts = const [],
    this.shippingAddress,
    this.emailVerified = false,
  });

  // Create from Firestore document
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserModel(
      uid: doc.id,
      email: data['email'] ?? '',
      displayName: data['displayName'] ?? '',
      photoURL: data['photoURL'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      lastLoginAt: (data['lastLoginAt'] as Timestamp?)?.toDate(),
      favoriteProducts: List<String>.from(data['favoriteProducts'] ?? []),
      shippingAddress: data['shippingAddress'],
      emailVerified: data['emailVerified'] ?? false,
    );
  }

  // Create from Firebase Auth User
  factory UserModel.fromAuthUser(User user, String displayName) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: displayName,
      photoURL: user.photoURL,
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
      emailVerified: user.emailVerified,
    );
  }

  // Convert to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'createdAt': FieldValue.serverTimestamp(),
      'lastLoginAt': FieldValue.serverTimestamp(),
      'favoriteProducts': favoriteProducts,
      'shippingAddress': shippingAddress,
      'emailVerified': emailVerified,
    };
  }

  // Copy with method for updates
  UserModel copyWith({
    String? displayName,
    String? photoURL,
    List<String>? favoriteProducts,
    Map<String, dynamic>? shippingAddress,
    bool? emailVerified,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      displayName: displayName ?? this.displayName,
      photoURL: photoURL ?? this.photoURL,
      createdAt: createdAt,
      lastLoginAt: lastLoginAt,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      emailVerified: emailVerified ?? this.emailVerified,
    );
  }
}
