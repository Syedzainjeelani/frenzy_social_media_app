import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/following_circle.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(currentUser.backgroundImageUrl),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    UserCircle(
                      user: currentUser,
                      width: 80,
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        currentUser.name,
                        style: TextStyle(
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.supervised_user_circle),
            title: Text('Your Profile'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.directions_run),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
