import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals'),),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),

        // Map dummy data(DUMMY_CATEGORIES) into the widget(Category Item)
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(catData.modelTitle, catData.modelColor);
        }).toList(),
      ),
    );
  }
}
