import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_shopping_v/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:ecommerce_shopping_v/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:ecommerce_shopping_v/constants/colors.dart';

class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}


class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 290,
        decoration: BoxDecoration(

          color: ColorsConsts.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  //borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                  child: Container(
                    width: double.infinity,
                    height: 110, // ارتفاع ثابت للصورة
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                badges.Badge(
                  badgeAnimation: badges.BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeStyle: BadgeStyle(
                    shape: BadgeShape.square,
                    //borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
                    badgeColor: Colors.pink,
                  ),
                  badgeContent: Text('جديد', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'وصف المنتج',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1, // تقليل عدد الأسطر
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$ 158.99',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الكمية: 12',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(18.0),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}