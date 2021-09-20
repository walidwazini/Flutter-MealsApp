import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  //const CategoryMealsScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String,dynamic>;
    final categoryTitle = routesArgs['title'];
    final categoryId = routesArgs['id'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Center(
          child: Text('Recipe for the Category'),
        ));
  }
}
