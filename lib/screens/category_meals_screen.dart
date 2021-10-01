import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // LOAD ALL MEALS based on their id after page is loaded
  @override
  void initState() {
    final routesArgs =
    ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final categoryTitle = routesArgs['title'];
    final categoryId = routesArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.initState();
  }

  void _removeMeal(String mealId){

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
                  id:categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  affordability: categoryMeals[index].affordability,
                  complexity: categoryMeals[index].complexity);
            },
            itemCount: categoryMeals.length,
          ),
        ));
  }
}
