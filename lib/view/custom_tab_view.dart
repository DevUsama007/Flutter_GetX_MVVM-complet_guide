// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyTaskBarApp extends StatefulWidget {
//   @override
//   _MyTaskBarAppState createState() => _MyTaskBarAppState();
// }

// class _MyTaskBarAppState extends State<MyTaskBarApp> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   static const List<Widget> _pages = <Widget>[
//     Center(child: Text('Home Page')),
//     Center(child: Text('Profile Page')),
//     Center(child: Text('Settings Page')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomSheet: Row(
//         children: [
//           Icon(Icons.home),
//         ],
//       ),
//       appBar: AppBar(
//         bottom: PreferredSize(
//             preferredSize: Size(Get.width, 20),
//             child: Row(
//               children: [Text("data"), Text("data")],
//             )),
//         title: const Text('Scaffold with Task Bar Example'),
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyCustomeTab extends StatefulWidget {
  @override
  State<MyCustomeTab> createState() => _MyCustomeTabState();
}

class _MyCustomeTabState extends State<MyCustomeTab> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Content for Tab 1')),
            Center(child: Text('Content for Tab 2')),
            Center(child: Text('Content for Tab 3')),
          ],
        ),
      ),
    );
  }
}
