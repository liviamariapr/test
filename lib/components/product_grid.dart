import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/product_item.dart';
import 'package:store/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;
  ProductGrid({ required this.showFavoriteOnly});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ProductList>(context);
    final loadedProducts = showFavoriteOnly? provider.items:provider.favorite;
    return GridView.builder(
    padding: EdgeInsets.all(10),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 3/2,
      crossAxisSpacing: 10,
      mainAxisSpacing:10 
    ),
    
    itemCount: loadedProducts.length,
    itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
      value: loadedProducts[i],
      child: ProductaaItem()
    )
    );
  }
}