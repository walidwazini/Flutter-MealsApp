import 'package:flutter/material.dart';
import 'package:meals_app_1/data/dummy_data.dart';
import 'package:meals_app_1/models/meal.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewMyApp();
  }
}

// Todo replace
class NewMyApp extends StatefulWidget {
  // const NewMyApp({Key key}) : super(key: key);

  @override
  _NewMyAppState createState() => _NewMyAppState();
}

class _NewMyAppState extends State<NewMyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        } else if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        } else if (_filters['vegan'] && !element.isVegan) {
          return false;
        } else if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id = mealId),
        );
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Color.fromRGBO(255, 244, 224, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              // body1
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // body2
              bodyText1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color.fromRGBO(0, 0, 0, 1.0),
              ),
              // title
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (konteks) => TabsScreen(favouriteMealsList: _favouriteMeals),
        CategoryMealsScreen.routeName: (konteks) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (konteks) => MealDetailScreen(
              toggleFav: _toggleFavourite,
              isFavourite: _isMealFavourite,
            ),
        FiltersScreen.routeName: (konteks) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            )
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
