import 'package:ecommerce_shopping_v/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final List<Map<String, String>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/images/emptycart.png',
    },
    {
      'categoryName': 'Clothes',
      'categoryImagesPath': 'assets/images/emptycart.png',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath': 'assets/images/emptycart.png',
    },
    {
      'categoryName': 'Beauty & Health',
      'categoryImagesPath': 'assets/images/emptycart.png',
    },
    {
      'categoryName': 'Laptops',
      'categoryImagesPath': 'assets/images/emptycart.png',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagesPath': 'assets/images/emptycart.png',
    },
    {
      'categoryName': 'Watches',
      'categoryImagesPath': 'assets/images/emptycart.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(

          decoration: BoxDecoration(
            color: ColorsConsts.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(categories[widget.index]['categoryImagesPath']!),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150,
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: ColorsConsts.purple, // خلفية للكتابة
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Text(
              categories[widget.index]['categoryName']!,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}