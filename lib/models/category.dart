import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String modelTitle;
  final Color modelColor;

  const CategoryModel({
    @required this.id,
    @required this.modelTitle,
    this.modelColor = Colors.deepOrange
  });
}
