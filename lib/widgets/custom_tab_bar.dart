import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

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
        title: const Text('Custom Tab Bar'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(),
              tabs: const [
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
        children: const [
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

  const TabItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
