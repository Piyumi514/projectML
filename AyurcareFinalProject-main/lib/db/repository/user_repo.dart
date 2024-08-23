import 'package:ayurcare/db/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> addUser(Users users) async {
    try {
      await _usersCollection.add(users.toMap());
      print('Notification added successfully');
    } catch (e) {
      print('Error adding notification: $e');
    }
  }

  Future<List<Users>> getUsers() async {
    try {
      QuerySnapshot querySnapshot = await _usersCollection.get();
      return querySnapshot.docs
          .map((doc) => Users.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error getting notifications: $e');
      return [];
    }
  }

  Future<void> updateUsers(Users user) async {
    try {
      await _usersCollection
          .doc(user.email)
          .update(user.toMap());
      print('Notification updated successfully');
    } catch (e) {
      print('Error updating notification: $e');
    }
  }

  Future<void> deleteUsers(String userId) async {
    try {
      await _usersCollection.doc(userId).delete();
      print('Notification deleted successfully');
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }
}