import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class PreferenceService {
  PreferenceService._();

  static late SharedPreferences? _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static PreferenceService get instance {
    assert(
        _pref != null, "Please call PreferenceService.init(); before runApp()");
    return PreferenceService._();
  }

  String? getAccessToken() {
    return getUser()?.token;
  }

  void clear() {
    _pref!.clear();
  }

  void saveUser(User user) {
    print("token ${user.token}");
    _pref!.setString('user', json.encode(user.toJson()));
  }

  User? getUser() {
    final result = _pref!.getString('user');

    print(result);
    return result != null ? User.fromJson(json.decode(result)) : null;
  }
}
