import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Tab Bar'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(),
              tabs: [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.search, title: 'Search'),
                TabItem(icon: Icons.person, title: 'Profile'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.person),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const TabItem({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }
}
