import 'package:flutter/material.dart';

class ProductListWidget extends StatefulWidget {

  final String name, image, shopName;
  final double star;
  final int price;
  final BuildContext buildContext;

  const ProductListWidget({
    Key? key,
    required this.name,
    required this.image,
    required this.shopName,
    required this.star,
    required this.price,
    required this.buildContext,
  }) : super(key: key);


  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        children: <Widget>[
          Hero(
            tag: 'Home',
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  widget.image,
                  height: 90.0,
                  width: 90.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Product details will be displayed here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
