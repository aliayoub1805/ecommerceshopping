import 'package:ecommerce_shopping_v/constants/colors.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 170,
        child: Material(
          color: ColorsConsts.white,
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12,
                      top: 10,
                      child: Icon(
                        Icons.star,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 7,
                      child: Icon(
                        Icons.star_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Title',
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Price',
                            textAlign: TextAlign.end,

                            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold,),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,), // استخدام Spacer لملء المساحة
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Description',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(30.0),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  size: 25,
                                  color: Colors.black,
                                ),
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
        ),
      ),
    );
  }
}
