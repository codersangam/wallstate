import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallstate/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  void addUserData({
    required User currentUser,
    String? userName,
    String? userImage,
    String? userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection('usersData')
        .doc(currentUser.uid)
        .set({
      'userName': userName,
      'userImage': userImage,
      'userEmail': userEmail,
      'userId': currentUser.uid,
    });
  }

  // Get User Details
  UserModel? currentData;
  void fetchUserDetails() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection('usersData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (value.exists) {
      userModel = UserModel(
        userId: value.get('userId'),
        userName: value.get('userName'),
        userEmail: value.get('userEmail'),
        userImage: value.get('userImage'),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel? get getUserDetails {
    return currentData;
  }

  // User Logout
  Future<void> signOut(context) async {
    Navigator.pop(context);
    await FirebaseAuth.instance.signOut();
  }
}
