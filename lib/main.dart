import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/category_screen.dart';
import './models/meals.dart';
import './dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meals> _availableMeals = dummyMeals;
  List<Meals> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((item) {
        if (_filters['gluten'] && !item.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !item.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !item.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !item.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _logicFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((item) => item.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          dummyMeals.firstWhere((item) => item.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((item) => item.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme:
              ThemeData().colorScheme.copyWith(secondary: Colors.amber),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyLarge: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyMedium: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.pink,
            titleTextStyle: TextStyle(fontFamily: 'Raleway', fontSize: 20),
          )),
      initialRoute: '/',
      routes: {
        '/': (_) => TabsScreen(favoriteMeals: _favoriteMeals),
        MealsCategoryScreen.routeName: (_) =>
            MealsCategoryScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
            logicFavorite: _logicFavorite, isFavorite: _isMealFavorite),
        FiltersScreen.routeName: (_) => FiltersScreen(
              saveFilters: _setFilters,
              filtered: _filters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) => const CategoriesScreen());
      },
    );
  }
}
