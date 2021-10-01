import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // Add mutable property
  String categoryTitle;
  List<Meal> displayedMeals;

  // LOAD ALL MEALS based on their id after page is loaded
  @override
  void initState() {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    categoryTitle = routesArgs['title'];
    final categoryId = routesArgs['id'];
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((mealElement) => mealElement.id == mealId);
    });
  }

  @override
  Widget build(BuildContext konteks) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                affordability: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity,
                removeItem: _removeMeal,
              );
            },
            itemCount: displayedMeals.length,
          ),
        ));
  }
}
