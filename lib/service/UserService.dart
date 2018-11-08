import 'package:flutter_tuan/http/HttpClient.dart';
import 'BaseService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tuan/model/UserModel.dart';
import 'dart:convert';
import 'package:flutter_tuan/tool/Storage.dart';

class UserService extends BaseService {
  static String userKey = "userModel";

  static login(BuildContext context, Map<String, dynamic> map) async {
    String res = await HttpClient.post('/api/v1/login', map);
    Storage.write(userKey, res);
    Map user = json.decode(res);
    UserModel userModel = UserModel.fromJson(user);
    Navigator.of(context)
      ..pop(true)
      ..pushReplacementNamed('/home');
    return userModel;
  }

  static getUserInfo(BuildContext context) async {
    var userJson = await Storage.read(userKey);
    if (userJson == null) {
      Navigator.of(context)
        ..pushNamed('/login');
      return null;
    }

    return UserModel.fromJson(json.decode(userJson));
  }

  static logout(BuildContext context) async {
    Storage.delete(userKey);
    Navigator.of(context)
      ..pop(true)
      ..pushReplacementNamed('/home');
  }
}
