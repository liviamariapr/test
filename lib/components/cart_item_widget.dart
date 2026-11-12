import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size:40
        )
      ),
      onDismissed: (_){
        Provider.of<Cart>(context, listen: false).removeItem(cartItem.id);
      },
      
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal:15,
          vertical:4
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: Text('${cartItem.price}')
              ),
            )
          ),
          title: Text(cartItem.name),
          subtitle: Text('Total: R\$ ${cartItem.price*cartItem.quantity}'),
          trailing: Text('${cartItem.quantity}x')
        ),
      ),
    );
  }
}