import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class BrandsNavigationRail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // يمكنك إضافة منطق النقر هنا
      },
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        margin: EdgeInsets.only(right: 20.0, bottom: 5, top: 18),
        constraints: BoxConstraints(
          minHeight: 150,
          minWidth: double.infinity,
          maxHeight: 180,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU',
                    ),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
              ),
            ),
            FittedBox(
              child: Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                width: 160,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title',
                      maxLines: 4,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16, // إضافة حجم خط مناسب
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FittedBox(
                      child: Text(
                        'US 16 \$',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Category Name',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
