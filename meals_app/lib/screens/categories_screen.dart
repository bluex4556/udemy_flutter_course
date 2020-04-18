import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/category_widget.dart';

import 'package:mealsapp/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: DUMMY_CATEGORIES.map((category) {
              return CategoryWidget(
                categoryId: category.id,
                categoryText: category.title,
                categoryColor: category.color,
              );
            }).toList()),
      );
  }
}
