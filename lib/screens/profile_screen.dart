import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/helpers/profile_clipper.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_circle.dart';
import 'package:flutter_social_ui/widgets/posts_carousal.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  PageController _postsController;
  PageController _favoritesController;

  @override
  void initState() {
    super.initState();
    _postsController =
        PageController(initialPage: 1, keepPage: false, viewportFraction: 0.8);
    _favoritesController =
        PageController(initialPage: 1, keepPage: false, viewportFraction: 0.8);
  }

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
                    height: MediaQuery.of(context).size.height * 0.35,
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
                  bottom: 10,
                  left: MediaQuery.of(context).size.width * 0.5 - 60,
                  child: UserCircle(
                    height: 100,
                    width: 100,
                    user: currentUser,
                    hasBorder: false,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                currentUser.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      currentUser.following.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      currentUser.followers.toString(),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PostsCarousal(
              pageController: _postsController,
              title: 'Your Posts',
              posts: currentUser.posts,
            ),
            SizedBox(
              height: 10,
            ),
            PostsCarousal(
              pageController: _favoritesController,
              title: 'Favorites',
              posts: currentUser.favorites,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
