import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:hather_app/src/models/user.dart';
import 'package:hather_app/src/utils/local/preferences.dart';

class SAuth {

  final Preferences _preferences;

  SAuth(this._preferences);

  Future<Either> login(String phone) {
   throw UnimplementedError();
  }

  Future<Either> verify()  {
    throw UnimplementedError();
  }

  Future<Either> register(User user)   {
    throw UnimplementedError();
  }

  User? getUserData() {
    try {
      final userDataString = _preferences.get('user');
      if (userDataString == null) return null;
      final userData = jsonDecode(_preferences.get('user').toString());
      final user = User.fromMap(userData);
      return user;
    } catch (e) {
      return null;
    }
  }
}
