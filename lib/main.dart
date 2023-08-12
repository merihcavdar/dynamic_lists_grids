import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _users = List.filled(100, "merih");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Text('List'),
                Text('Grid'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _contentListView(),
              _contentGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentListView() {
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(
            _users[index],
          ),
          onTap: () => print("hello $index"),
        ),
      ),
      itemCount: _users.length,
    );
  }

  Widget _contentGridView() {
    return GridView.builder(
      itemCount: _users.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Card(
        child: GridTile(
          child: Center(
            child: Text(
              _users[index],
            ),
          ),
        ),
      ),
    );
  }
}
