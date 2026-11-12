import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/app_drawer.dart';
import 'package:store/components/order_widget.dart';
import 'package:store/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders= Provider.of<OrderList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos')
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
      ),
    );
  }
}
