import 'package:flutter/material.dart';

import '../screens/favourites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [ CategoriesScreen(), FavouritesScreen() ];
  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals Tab'),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor:Theme.of(context).accentColor ,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: 'Categories', ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites', ),
        ],
      ),
    );
  }
}
