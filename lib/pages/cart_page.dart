import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/cart_item_widget.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final items = cart.items.values;
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(25),
            child:Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text( 'Total: ',
                  style: TextStyle(
                    fontSize: 20,
                  )),
                  SizedBox(width:10),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      'R\$${cart.totalAmount}',
                      style: TextStyle(
                        color: Colors.white,
                      ))
                  ),
                  Spacer(),
                  TextButton(
                    child: Text('Comprar',
                    style: TextStyle(
                    fontSize: 20,
                  )),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                      )

                    ),
                    onPressed: (){
                      Provider.of<OrderList>(context, listen:false).addOrder(cart);
                      cart.clear();
                    },

                  )
                ]
              ),
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, i) => CartItemWidget(cartItem: items.elementAt(i)),
            ),
          )
          
        ]
      )
    );

  }
}