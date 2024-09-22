import 'package:flutter/material.dart';

import '../listitem/product_list.dart';


class ShoppingCard extends StatefulWidget {
  const ShoppingCard({super.key});
  @override
  _ShoppingCardState createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: ProductListWidget(
              name: "Men's clothing",
              image: 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
              shopName: 'Den cosmics',
              star: 4.5,
              price: 12,
              buildContext: context,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: ProductListWidget(
              name: "Jewelery",
              image: 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
              shopName: 'Lee Shop',
              star: 3.8,
              price: 14,
              buildContext: context,
            ),
          ),
          // Add more product cards here
        ],
      ),
    );
  }
}