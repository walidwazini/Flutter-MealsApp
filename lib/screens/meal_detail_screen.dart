import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  //const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('$mealId ${selectedMeal.title}',),
        ),
        body: Column(
          children: [
            // 1) For image, need to find which id the user selected,
            // --- so need to import the data. and make a condition to compare the id
            Container(
              height: 300,width:double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,), ),
            Text('THe meal id - $mealId --'),
          ],
        ));
  }
}
