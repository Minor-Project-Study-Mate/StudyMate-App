// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart' show GoogleSignInAccount;

extension AppUserFromGoogleSignInAccount on GoogleSignInAccount {
  AppUser get fromGoogleSignInAccount => AppUser(
      displayName: displayName ?? "", photoURL: photoUrl ?? "", email: email);
}

class AppUser {
  String displayName;
  String photoURL;
  String email;
  AppUser(
      {required this.displayName, required this.photoURL, required this.email});

  AppUser copyWith({String? displayName, String? photoURL, String? email}) =>
      AppUser(
          displayName: displayName ?? this.displayName,
          photoURL: photoURL ?? this.photoURL,
          email: email ?? this.email);

  Map<String, dynamic> toMap() => <String, dynamic>{
        'displayName': displayName,
        'photoURL': photoURL,
        'email': email,
      };

  factory AppUser.fromMap(Map<String, dynamic> map) => AppUser(
      displayName: map['displayName'] as String,
      photoURL: map['photoURL'] as String,
      email: map['email'] as String);

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AppUser(displayName: $displayName, photoURL: $photoURL, email: $email)';

  @override
  bool operator ==(covariant AppUser other) => (identical(this, other))
      ? true
      : other.displayName == displayName &&
          other.photoURL == photoURL &&
          other.email == email;

  @override
  int get hashCode => displayName.hashCode ^ photoURL.hashCode ^ email.hashCode;
}
