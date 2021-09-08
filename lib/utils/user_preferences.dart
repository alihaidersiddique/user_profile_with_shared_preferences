import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app_2/models/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static const myUser = User(
      imagePath: 'imagePath',
      name: 'Muhammad Ali Haider',
      email: 'ahs@gmail.com',
      about:
          'Learning flutter development and doing Bachelors in Software Engineering.',
      isDarkMode: false);

  // a key for particluar place having shared preferences

  static const keyUser = 'user';

  // a method for setting user data

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
