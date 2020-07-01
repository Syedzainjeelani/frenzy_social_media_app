import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/helpers/profile_clipper.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_circle.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    image: AssetImage(currentUser.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30.0),
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.menu),
                        iconSize: 30,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width * 0.5 - 50,
                  child: UserCircle(
                    height: 100,
                    width: 100,
                    user: currentUser,
                    hasBorder: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
