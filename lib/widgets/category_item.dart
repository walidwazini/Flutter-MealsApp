import 'package:flutter/material.dart';
import 'package:meals_app_1/screens/category_meals_screen.dart';

//import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({Key key}) : super(key: key);
  final String id;
  final String itemTitle;
  final Color itemColor;

  CategoryItem(this.id, this.itemTitle, this.itemColor);

  void selectCategory(BuildContext konteks){
    // MaterialPageRoute() is as a wrapper for animation between pages

    // Navigator.of(konteks).push(MaterialPageRoute(builder: (_){
    //   return CategoryMealsScreen(id,itemTitle) ;
    // },),);

    Navigator.of(konteks).pushNamed(
        CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title':itemTitle, 'color': itemColor } ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(13),
        child: Text(itemTitle, style: Theme.of(context).textTheme.bodyText1),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            itemColor.withOpacity(0.7),
            itemColor,
          ],
          begin: Alignment.topLeft , end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}
