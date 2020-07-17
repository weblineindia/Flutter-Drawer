import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_drawer.dart';
import 'drawer_screens/category.dart';
import 'drawer_screens/home.dart';

class HomeScreen extends StatelessWidget {
  final arrDrawerItems = [
    DrawerMenuItem(title: 'First View', icon: Icons.home, subItemWidget: null),
    DrawerMenuItem(
      title: 'Second View',
      icon: Icons.favorite,
      subItemWidget: const Text('13'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerVC(
        arrDrawerItems: arrDrawerItems,
        headerWidget: _buildHeaderForDrawer(context),
        isHeader: true,
        isShowIcon: true,
        textColor: Colors.black,
        selectedTextColor: Colors.amber,
        didItemSelected: (int selectedIndex) {},
      ),
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Consumer<DrawerNavigationProvider>(
            builder: (ctx, item, child) {
              if (item.selectedIndex == 0) {
                return const Text(
                  'First View',
                  style: TextStyle(color: Colors.white),
                );
              } else if (item.selectedIndex == 1) {
                return const Text('Second View',
                    style: TextStyle(color: Colors.white));
              } else {
                return null;
              }
            },
          ),
          brightness: Brightness.light),
      body: Center(
        child: Consumer<DrawerNavigationProvider>(
              builder: (ctx, item, child) {
                if (item.selectedIndex == 0) {
                  return Home();
                } else if (item.selectedIndex == 1) {
                  return Category();
                } else {
                  return null;
                }
              },
            ) ??
            const Text('No data'),
      ),
    );
  }

  Widget _buildHeaderForDrawer(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/header.png',
              height: 72.0,
              width: 72.0,
            ),
            const SizedBox(height: 12),
            const Text(
              'Title',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 4),
            const Text(
              'SubTitle',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
    );
  }
}
