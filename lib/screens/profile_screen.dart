import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded,
  ];

  @override
  void initState() {
    super.initState();
    // ضبط أسلوب واجهة النظام عند بدء الحالة

  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child:
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              //backgroundColor: const Color(0xFF6750A4), // خلفية AppBar
              elevation: 0,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                  child: Text(
                    'User information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      userListTile("Email", "example@example.com", _userTileIcons[0], context),
                      userListTile("Phone", "+123456789", _userTileIcons[1], context),
                      userListTile("Shipping Address", "1234 Street, City", _userTileIcons[2], context),
                      userListTile("Joined", "January 1, 2022", _userTileIcons[3], context),
                      userListTile("Log out", "Tap to log out", _userTileIcons[4], context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget userListTile(String title, String subTitle, IconData iconData, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: ListTile(
          onTap: () {
            // منطق الزر هنا
          },
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(iconData, color: Colors.blue),
        ),
      ),
    );
  }
}