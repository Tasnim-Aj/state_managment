// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../provider/cart_manager.dart';
//
// class CartPage extends StatelessWidget {
//   const CartPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CartManager>(
//       builder: (context, providerCart, child) => Scaffold(
//         appBar: AppBar(title: Text(providerCart.getPrice().toString())),
//         body: ListView.builder(
//           itemCount: providerCart.cart.products.length,
//           itemBuilder: (context, index) => ListTile(
//             leading: CircleAvatar(
//               child:
//                   Text(providerCart.cart.products[index].quantity.toString()),
//             ),
//             title: Text(providerCart.cart.products[index].name),
//             subtitle: Text(providerCart.cart.products[index].price.toString()),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartManager>(
      builder: (context, providerCart, child) => Scaffold(
        appBar: AppBar(title: const Text('Orders')),
        body: ListView.builder(
          itemCount: providerCart.orders.length,
          itemBuilder: (context, orderIndex) {
            final order = providerCart.orders[orderIndex];
            return Card(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Order ${orderIndex + 1}'),
                    subtitle:
                        Text('Total: ${providerCart.getOrderPrice(order)}'),
                    children: [
                      for (var product in order.products)
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(product.quantity.toString()),
                          ),
                          title: Text(product.name),
                          subtitle: Text('${product.price}'
                              // ' - ${product.quantity}'
                              ),
                        ),
                    ],
                  ),
                  // ListTile(
                  //   title: Text(
                  //       'Order ${orderIndex + 1} - Total: ${providerCart.getOrderPrice(order)}'),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
