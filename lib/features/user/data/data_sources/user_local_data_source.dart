import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getLastUser();
  Future<void> clearCache();
}

class UserLocalDataSourceImpl extends UserLocalDataSource{
  final SharedPreferences sharedPreference;
  UserLocalDataSourceImpl({required this.sharedPreference});

  static const CACHED_USER = 'CACHED_USER';

  @override
  Future<void> cacheUser(UserModel user) async {
    // TODO: implement cacheUser
    final userJson = json.encode(user.toJson());
    await sharedPreference.setString(CACHED_USER, userJson);
    
  }

  @override
  Future<void> clearCache() async{
    // TODO: implement clearCache
    await sharedPreference.remove(CACHED_USER);
  }

  @override
  Future<UserModel?> getLastUser() async{
    // TODO: implement getLastUser
    final userJson = sharedPreference.getString(CACHED_USER);

    if (userJson != null){
      return UserModel.fromJson(json.decode(userJson));
    } else {
      return null;
    }
  }

  
}