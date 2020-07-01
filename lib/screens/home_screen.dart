import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_users.dart';
import 'package:flutter_social_ui/widgets/posts_carousal.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        centerTitle: true,
        title: Text(
          'FRENZY',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              letterSpacing: 6.0,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          unselectedLabelStyle:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          indicatorWeight: 4.0,
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UsersCarousal(
                title: 'Following',
                users: users,
              ),
              PostsCarousal(
                pageController: _pageController,
                title: 'Posts',
                posts: posts,
              ),
              UsersCarousal(
                title: 'Followers',
                users: users.reversed.toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
