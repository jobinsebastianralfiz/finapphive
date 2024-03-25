import 'package:finapphive/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class AuthService {
  Box<UserModel>? _userBox;

  // Future<void> openBox() async {
  //   _userBox = await Hive.openBox<UserModel>('users');
  // }

  Future<void> openBox() async {
    _userBox = await Hive.openBox<UserModel>('users');
  }

  // Future<bool?> registerUser(UserModel user) async {
  //   if (_userBox == null) {
  //     await openBox();
  //   }
  //   await _userBox!.add(user);
  //   return false;
  // }

  Future<bool?> registerUser(UserModel user) async {
    if (_userBox == null) {
      await openBox();
    }

    await _userBox!.add(user);
    return true;
  }

  //closebox

  // login

  Future<UserModel?> loginUser(String email, String password) async {
    if (_userBox == null) {
      await openBox();
    }

    // Iterate through all users in the box
    for (var user in _userBox!.values) {
      // Check if email and password match
      if (user.username == email && user.password == password) {
        // Return the user if found
        return user;
      }
    }

    // If no user found with matching email and password, return null
    return null;
  }

// logout

  // already login
}
