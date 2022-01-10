import 'package:flutter/material.dart';
import 'package:meals_app_1/models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteItems;
  FavouritesScreen({Key key, this.favouriteItems});

  @override
  Widget build(BuildContext context) {
    if (favouriteItems.isEmpty){
      return Center(child: Text('No Favourites - start adding some'),);
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteItems[index].id,
            title: favouriteItems[index].title,
            imageUrl: favouriteItems[index].imageUrl,
            duration: favouriteItems[index].duration,
            affordability: favouriteItems[index].affordability,
            complexity: favouriteItems[index].complexity,
          );
        },
        itemCount: favouriteItems.length,
      );
    }
  }
}
