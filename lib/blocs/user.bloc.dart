import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loja_bloc_provider/models/user.model.dart';
import 'package:loja_bloc_provider/repositories/account.repository.dart';
import 'package:loja_bloc_provider/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends ChangeNotifier {
  var user = new UserModel();

  UserBloc() {
    user = null;
    loadUser();
  }

  Future<UserModel> authenticate(UserModel model) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var repository = new AccountRepository();
      var res = await repository.authenticate(model);

      user = res;
      await prefs.setString('user', jsonEncode(res));

      return res;
    } catch (ex) {
      user = null;
      return null;
    }
  }

  Future<UserModel> create(UserModel model) async {
    try {
      var repository = new AccountRepository();
      var res = await repository.create(model);
      return res;
    } catch (ex) {
      print(ex);
      user = null;
      return null;
    }
  }

  logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    notifyListeners();
  }

  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var res = UserModel.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
    }
  }
}
