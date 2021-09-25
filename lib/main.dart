import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.purpleAccent,
        canvasColor: Color.fromRGBO(255, 244, 224, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          // body1
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          // body2
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          // title
          headline6: TextStyle(fontSize: 20,fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold ),
        ),
      ),
      home: CategoriesScreen(),
      //initialRoute: '/',
      routes: {
        //'/' : (konteks) => CategoriesScreen(),
        //'/category-meals': (konteks) => CategoryMealsScreen()
        CategoryMealsScreen.routeName : (konteks) => CategoryMealsScreen(),
        MealDetailScreen.routeName : (konteks) => MealDetailScreen(),
      },
      onUnknownRoute: (settings){
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
