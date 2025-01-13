import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card/Home.dart';
import 'package:flutter_card/basic_mobile.dart';
import 'package:flutter_card/instagram_page.dart';
import 'package:flutter_card/login_screen.dart';
import 'package:flutter_card/simple_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      endDrawer: _buildEndDrawer(context),
    );
  }

  Widget _buildEndDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtY2aqkYA54jTqgCQmP2Zl0W7BwjM_XQ7vjg&s')
                  ),
          ListTile(
            leading:const Icon(Icons.person),
            title:const Text('Profile'),
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading:const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: () {},
          ),
          ExpansionTile(
            title: const Text('Themes Color'),
            initiallyExpanded: true,
            children: [
              ListTile(
                leading:const Icon(Icons.light_mode),
                title:const Text('Light Mode'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title:const Text('Dark Mode'),
                onTap: () {},
              ),
            ]
          ),
          Padding(padding:const EdgeInsets.all(20),
          child: Image.network('https://static.wixstatic.com/media/d098c7_2b27aff5f559425aab51dde7a1616e98~mv2.jpg/v1/fill/w_940,h_320,al_c,q_80/acleda%20(1).jpg'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => SimpleStateScreen(),
                  fullscreenDialog: true,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: currentIndex,
      children: [
        HomeApp(),
        SimpleStateScreen(),
      ],
    );
  }

  int currentIndex = 0;
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Notifications'),
      ],
      currentIndex: currentIndex,
      selectedItemColor: const Color.fromARGB(255, 250, 101, 2),
      onTap: (index) {
        if (index == 2) {
          scaffoldKey.currentState!.openEndDrawer();
        } else {
          setState(() {
            currentIndex = index;
            // Navigate to the selected screen based on the index
          });
        }
      },
    );
  }
}
