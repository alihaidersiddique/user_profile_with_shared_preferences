import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences_app_2/models/user.dart';
import 'package:shared_preferences_app_2/pages/edit_profile_page.dart';
import 'package:shared_preferences_app_2/utils/user_preferences.dart';
import 'package:shared_preferences_app_2/widgets/appbar_widget.dart';
import 'package:shared_preferences_app_2/widgets/button_widget.dart';
import 'package:shared_preferences_app_2/widgets/numbers_widget.dart';
import 'package:shared_preferences_app_2/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfile(),
                  ));
                },
              ),
              const SizedBox(height: 20),
              buildName(user),
              const SizedBox(height: 20),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 20),
              NumbersWidget(),
              const SizedBox(height: 20),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            )
          ],
        ),
      );

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
}
