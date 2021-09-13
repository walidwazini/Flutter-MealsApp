import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({Key key}) : super(key: key);
  final String itemTitle;
  final Color itemColor;

  CategoryItem(this.itemTitle, this.itemColor);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
