import 'package:flutter/material.dart';
import 'FollowPage.dart';
import 'RecommendPage.dart';
import 'NearbyPage.dart';

class ExplorePage extends StatefulWidget {
  @override
  State createState() {
    return new _ExplorePageState();
  }
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    new Tab(
      text: '关注',
    ),
    new Tab(
      text: '推荐',
    ),
    new Tab(
      text: '附近',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Container(
          child: new Center(
            child: new TabBar(
              controller: _tabController,
              tabs: myTabs,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              labelStyle: new TextStyle(fontSize: 16.0),
              unselectedLabelStyle: new TextStyle(fontSize: 12.0),
            ),
          ),
        ),
      ),
      body: new TabBarView(
        children: [
          new FollowPage(),
          new RecommendPage(),
          new NearbyPage(),
        ],
        controller: _tabController,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: myTabs.length, initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
