import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String fullName;
  final String email;
  final String password;

  Users({
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory Users.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Users(
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
    };
  }
}