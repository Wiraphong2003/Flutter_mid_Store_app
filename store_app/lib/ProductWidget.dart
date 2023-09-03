import 'package:flutter/material.dart';
import 'package:store_app/ServicesP.dart';

import 'models/products.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Products>(
      future: ServicesP.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final products = snapshot.data?.products;

          if (products != null && products.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(50),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Card(
                    child: Column(
                  children: [
                    Image.network(product.image),
                    // แสดงข้อความด้านล่าง
                    ListTile(
                      title: Text(product.title),
                    ),
                    Text('Rate: ${product.rating.rate}'),
                    // คั้นแยกระหว่างรายการสินค้า
                    const Divider(),
                  ],
                ));
              },
            );
          } else {
            return const Text('No products available.');
          }
        }
      },
    );
  }
}
