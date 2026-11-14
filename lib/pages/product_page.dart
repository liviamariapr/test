import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/app_drawer.dart';
import 'package:store/components/produt_item_widget.dart';
import 'package:store/models/product_list.dart';
import 'package:store/utils/app_routes.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productlist= Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produto'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCTS_FORM,
            );
          }
          , icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: productlist.items.length ,
        itemBuilder: (ctx,i)=>Column(
          children: [
            ProductItemWidget(product: productlist.items[i]),
            Divider()
          ],
        ),
      )
    );
  }
}