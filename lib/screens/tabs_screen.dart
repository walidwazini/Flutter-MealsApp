import 'package:flutter/material.dart';

import '../screens/favourites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text('Meals Tab'),
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.category),text: 'Categories',),
          Tab(icon: Icon(Icons.favorite),text: 'Favourites',),
        ],),
      ),
      body: TabBarView(children: [
        CategoriesScreen(),FavouritesScreen()
      ],),
    ));
  }
}
