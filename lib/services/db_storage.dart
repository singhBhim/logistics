import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logistics_app/view/auth/login.dart';

class DbStorage {
  final box = GetStorage();
  final String userIdKey = 'user_id';
  final String tokenKey = 'token';
  final String counts = 'counts';


  // Set User ID
  Future<void> setUserid(String userId) async {
    await box.write(userIdKey, userId);
  }

  // Get User ID
  String? getUserId() {
    return box.read(userIdKey);
  }

  // Set Token
  Future<void> setToken(String token) async {
    await box.write(tokenKey, token);
  }

  // Get Token
  String? getToken() {
    return box.read(tokenKey);
  }


  // Set User ID
  Future<void> setNotiCounts(String name) async {
    await box.write(counts, name);
  }
  // Get Token
  String? getNotiCounts() {
    return box.read(counts);
  }



  // Clear all stored data
  Future<void> clearAllData(BuildContext context) async {
    await box.erase();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginPage()), (route)=>false);
  }
}
