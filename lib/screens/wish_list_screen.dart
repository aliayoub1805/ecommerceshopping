
import 'package:flutter/material.dart';

import '../widgets/wish_list_empty.dart';
import '../widgets/wish_list_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isNotEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(body: WishlistFull());

  }
}
