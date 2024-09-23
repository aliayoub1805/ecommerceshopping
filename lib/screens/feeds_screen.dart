

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/feeds_product.dart';
/*
class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
        Text('Feeds'),
      ),
    );
  }
}
*/

class FeedsScreen extends StatelessWidget {
  static const routeName = '/FeedsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF9F2FA),
        appBar: AppBar(
          backgroundColor: Color(0xFF6750A4),
          title: Center( // استخدام Center هنا
            child: Text(
              'מוצרים חדשים',
              style: TextStyle(
                color: ColorsConsts.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: GridView.count(
          padding: const EdgeInsets.only(top:50,right: 10,left: 10),
          crossAxisCount: 2,
          childAspectRatio: 240 / 290,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(20, (index) {
            return FeedProducts();
          }),
        )

    );
  }
}