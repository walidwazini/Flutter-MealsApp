import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  //const CategoryMealsScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext konteks) {
    final routesArgs =
        ModalRoute.of(konteks).settings.arguments as Map<String,dynamic>;
    final categoryTitle = routesArgs['title'];
    final categoryId = routesArgs['id'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Center(
          // child: ListView.builder(itemBuilder: (ctx, index) {
          //
          // } ,itemCount:  ,),
        ));
  }
}
