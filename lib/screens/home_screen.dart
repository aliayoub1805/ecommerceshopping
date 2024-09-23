

import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../constants/colors.dart';
import '../widgets/backlayer.dart';
import '../widgets/brands_navi_rail_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/popular_products.dart';


class HomeScreen extends StatelessWidget {
  List _carouselIcons = [
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
  ];

  List _brandImages = [
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
    'assets/images/emptycart.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F2FA),
      body: BackdropScaffold(
        frontLayerBackgroundColor: ColorsConsts.background,
        headerHeight: MediaQuery.of(context).size.height * 0.25,
        appBar: AppBar(
          backgroundColor: Color(0xFF6750A4),
          title: Center( // استخدام Center هنا
            child: Text(
              'דף הבית',
              style: TextStyle(
                color: ColorsConsts.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          leading: BackdropToggleButton(icon: AnimatedIcons.home_menu),

        ),
        backLayer: BackLayerMenu(),
        frontLayer: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190.0,
                width: double.infinity,
                child: AnotherCarousel(
                  boxFit: BoxFit.fill,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 5.0,
                  dotIncreasedColor: Colors.purple,
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  showIndicator: true,
                  indicatorBgPadding: 5.0,
                  images: [
                    ExactAssetImage(_carouselIcons[0]),
                    ExactAssetImage(_carouselIcons[1]),
                    ExactAssetImage(_carouselIcons[2]),
                    ExactAssetImage(_carouselIcons[3]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'קטגוריות',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
              ),
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryWidget(
                      index: index,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'מותגים פופולריים',
                      style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Spacer(),
                    TextButton (
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          BrandNavigationRailScreen.routeName,
                          arguments: {
                            7,
                          },
                        );
                      },
                      child: Text(
                        'הצג הכל..',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Swiper(
                  itemCount: _brandImages.length,
                  autoplay: true,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  onTap: (index) {
                    Navigator.of(context).pushNamed(
                      BrandNavigationRailScreen.routeName,
                      arguments: {
                        index,
                      },
                    );
                  },
                  itemBuilder: (BuildContext ctx, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        color: ColorsConsts.white,
                        child: Image.asset(
                          _brandImages[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'מוצרים פופולריים',
                      style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Spacer(),
                    TextButton (
                      onPressed: () {},
                      child: Text(
                        'הצג הכל..',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 260,
                margin: EdgeInsets.symmetric(horizontal: 3),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (BuildContext ctx, int index) {
                      return PopularProducts();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
