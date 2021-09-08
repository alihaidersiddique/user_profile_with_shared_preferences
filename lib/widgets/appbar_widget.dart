import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences_app_2/themes.dart';
import 'package:shared_preferences_app_2/utils/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final user = UserPreferences.getUser();
  final isDarkMode = user.isDarkMode;
  final icon = isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

            final switcher = ThemeSwitcher.of(context);

            switcher!.changeTheme(theme: theme);

            final newUser = user.copy(isDarkMode: isDarkMode);

            UserPreferences.setUser(newUser);
          },
          icon: Icon(icon),
        ),
      )
    ],
  );
}
