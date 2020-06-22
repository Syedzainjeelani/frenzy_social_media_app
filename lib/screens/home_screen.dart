import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(),
    );
  }
}
