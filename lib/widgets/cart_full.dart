import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'empty_cart_screen.dart';

class CartFull extends StatefulWidget {
  const CartFull({super.key});

  @override
  State<CartFull> createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  List<CartItem> cartItems = [
    CartItem(title: 'Product 1', price: 450,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),

    CartItem(title: 'Product 2', price: 120,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),

    CartItem(title: 'Product 3', price: 150,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),

    CartItem(title: 'Product 4', price: 10.5,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),

    // يمكنك إضافة المزيد من المنتجات هنا
  ];

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( // استخدم Scaffold هنا
      appBar: AppBar(
        backgroundColor: Color(0xFF6750A4),
        title: Center( // استخدام Center هنا
          child: Text(
            'סל הקניות',
            style: TextStyle(
              color: ColorsConsts.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: cartItems.isEmpty
          ? EmptyCartScreen()
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return buildCartItem(cartItems[index], index);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.purple.shade700,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    'السعر النهائي:',
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '${getTotalPrice()}\$',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.yellow),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // منطق الدفع هنا
                    },
                    child: Text('ادفع الآن'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow, // لون الزر
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartItem(CartItem item, int index) {
    double subtotal = item.price * item.quantity;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('خطأ في تحميل الصورة'));
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('السعر:'),
                        SizedBox(width: 5),
                        Text('${item.price}\$', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('الإجمالي:'),
                        SizedBox(width: 5),
                        Text('${subtotal}\$', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, color: Colors.red),
                          onPressed: () => decreaseQuantity(index),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${item.quantity}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.green),
                          onPressed: () => increaseQuantity(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeItem(index),
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
    );
  }
}

class CartItem {
  final String title;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({required this.title, required this.price, required this.imageUrl, this.quantity = 1});
}
