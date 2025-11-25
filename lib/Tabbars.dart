import 'package:flutter/material.dart';

class Tabbars extends StatefulWidget {
  const Tabbars({super.key, required this.title});
  final String title;
  @override
  State<Tabbars> createState() => _TabbarsState();
}

class _TabbarsState extends State<Tabbars> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade800,
          title: Center(
            child: Text("Tabbar", style: TextStyle(fontFamily: "PairPlay")),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TabBar(
                labelColor: const Color.fromARGB(255, 32, 255, 7),
                unselectedLabelColor: const Color.fromARGB(255, 3, 149, 42),
                indicatorColor: Colors.pink,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.cloud_outlined), text: "Tab 1"),
                  Tab(icon: Icon(Icons.beach_access_sharp), text: "Tab 2"),
                  Tab(icon: Icon(Icons.brightness_5_sharp), text: "Tab 3"),
                  Tab(icon: Icon(Icons.cloud_outlined), text: "Tab 4"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: const <Widget>[
            Center(child: Text("TAB1 AÇIKLAMA")),
            Center(child: Text("TAB2 AÇIKLAMA")),
            Center(child: Text("TAB3 AÇIKLAMA")),
            Center(child: Text("TAB4 AÇIKLAMA")),
          ],
        ),
      ),
    );
  }
}
