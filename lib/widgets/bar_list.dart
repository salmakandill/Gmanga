import 'package:flutter/material.dart';
import 'package:gmanga/pages/category_page.dart';
import 'package:gmanga/pages/model.dart';
import 'package:gmanga/widgets/home_cards.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(
      images: 'images/Solo_Leveling.jpeg',
      categoryName: 'Action',
      genreId: 1,
    ),
    CategoryModel(
      images: 'images/White_Blood.jpg',
      categoryName: 'Fantasy',
      genreId: 10,
    ),
    CategoryModel(
      images: 'images/Death_Is_The_Only_Ending_For_The_Villain.webp',
      categoryName: 'Drama',
      genreId: 2,
    ),
    CategoryModel(
      images: 'images/mom_sorry.jpg',
      categoryName: 'Comedy',
      genreId: 4,
    ),
    CategoryModel(
      images: 'images/Sweet_Home.jpg',
      categoryName: 'Horror',
      genreId: 14,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    genreId: categories[index].genreId,
                    genreName: categories[index].categoryName,
                  ),
                ),
              );
            },
            child: CategoryCard(category: categories[index]),
          );
        },
      ),
    );
  }
}
