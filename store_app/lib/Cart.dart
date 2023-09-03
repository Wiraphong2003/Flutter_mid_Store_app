import 'package:flutter/material.dart';
import 'package:store_app/ServicesC.dart';
import 'package:store_app/models/index.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Carts>(
      future: ServicesC.getCarts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final carts = snapshot.data?.carts;

          if (carts != null && carts.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: carts.length,
              itemBuilder: (context, index) {
                final cart = carts[index];

                return Card(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ListTile(
                        title: Text('Product ID: ${cart.id}'),
                        subtitle: Text('Date order : ${cart.date}'),
                        trailing: const Icon(Icons.remove_red_eye),
                      )
                    ],
                  ),
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
