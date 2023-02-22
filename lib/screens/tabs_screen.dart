import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  List<Meals> favoriteMeals;

  TabsScreen({Key key, this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pageList;

  @override
  void initState() {
    _pageList = [
      {
        'title': 'Categories',
        'page': const CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'page': FavoritesScreen(favoriteMeal: widget.favoriteMeals),
      }
    ];
    super.initState();
  }

  int _selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageList[_selectedPage]['title']),
      ),
      body: _pageList[_selectedPage]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
