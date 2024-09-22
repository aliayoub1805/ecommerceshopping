

import 'package:ecommerce_shopping_v/cards/shopping_card.dart';
import 'package:ecommerce_shopping_v/screens/cart_full.dart';


import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9F2FA),
      body: CartFull(),
    );
  }
}
