import 'package:ecommerce_shopping_v/screens/feeds_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../screens/cart_screen.dart';

class BackLayerMenu extends StatelessWidget {
  final List<IconData> _contentIcons = [
    Icons.rss_feed,
    Icons.shopping_bag,
    Icons.favorite,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF6750A4),
                Color(0xFF6750A4),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        ..._buildBackgroundShapes(),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildProfilePicture(),
                const SizedBox(height: 10.0),
                _content(context, FeedsScreen.routeName, 'מוצרים חדשים', 0),
                const SizedBox(height: 10.0),
                _content(context, CartScreen.routeName, 'סל הקניות', 1),
                const SizedBox(height: 10.0),
                _content(context, FeedsScreen.routeName, 'רשימת משאלות', 2),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildBackgroundShapes() {
    return [
      Positioned(
        top: -100.0,
        left: 140.0,
        child: _buildRotatedContainer(250),
      ),
      Positioned(
        bottom: 0.0,
        right: 100.0,
        child: _buildRotatedContainer(300),
      ),
      Positioned(
        top: -50.0,
        left: 60.0,
        child: _buildRotatedContainer(200),
      ),
      Positioned(
        bottom: 10.0,
        right: 0.0,
        child: _buildRotatedContainer(200),
      ),
    ];
  }

  Widget _buildRotatedContainer(double height) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white.withOpacity(0.3),
        ),
        width: 150,
        height: height,
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _content(BuildContext ctx, String routeName, String text, int index) {
    return InkWell(
      onTap: () => navigateTo(ctx, routeName),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: ColorsConsts.background,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(_contentIcons[index], color: ColorsConsts.background,),
        ],
      ),
    );
  }

  void navigateTo(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(routeName);
  }
}
