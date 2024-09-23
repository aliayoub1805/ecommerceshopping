

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/my_icons.dart';
import 'cart_screen.dart';
import 'feeds_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';



class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreen();
}
class _BottomBarScreen extends State<BottomBarScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    FeedsScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  Color _getIconColor(int index) {
    return _pageIndex == index ? Colors.yellow.shade900 : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color(0xFF6750A4), // لون شريط الحالة (dark blue)
        statusBarIconBrightness: Brightness.light, // أيقونات بيضاء
      ),
    );
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: _pageIndex,
      onTap: (value){
        setState(() {
          _pageIndex=value;
        });
      },
      unselectedItemColor: Colors.blue,
      selectedItemColor: Colors.purple,

      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, ),label: 'בית',),
        BottomNavigationBarItem(icon: Icon(Icons.rss_feed, ),label: 'חדש',),
        BottomNavigationBarItem(icon: Icon(Icons.search, ),label: 'חיפוש',),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, ),label: 'קניות',),
        BottomNavigationBarItem(icon: Icon(Icons.person,),label: 'פרופייל',),
      ],
    ),
      body: Directionality(
        textDirection: TextDirection.rtl
        , child: _pages[_pageIndex],),
    );
  }
}
