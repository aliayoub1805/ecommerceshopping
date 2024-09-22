

import 'package:ecommerce_shopping_v/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeChange = Provider.of<DarkThemeProvider>(context);
    final themeData = ThemeData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/emptycart.png'),
              fit: BoxFit.fill
            ),
          ),

        ),

        Text(
          "Your cart is empty",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsConsts.title,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 50,),
        Text(
          "Looks like you didn\'t \n add anything to your cart yet.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsConsts.subTitle,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 30,),
        Container(
          width: MediaQuery.of(context).size.width*0.9,
          height:MediaQuery.of(context).size.width*0.09 ,
          child: ElevatedButton(
            onPressed: () {
              // منطق الزر هنا
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: Colors.purple,
                ),
              ),
              backgroundColor: ColorsConsts.buttonBackground,
            ),

            child: Text('Shop Now'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
            ),
          ),
        )
      ],
    );
  }
}
