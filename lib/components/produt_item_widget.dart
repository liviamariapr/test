import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/models/product_list.dart';
import 'package:store/utils/app_routes.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  const ProductItemWidget ({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl) ,
      ),
      title: Text(product.title),
      trailing: Container(
        width:100,
        child: Row(
          children:[
            IconButton(
        icon: Icon(Icons.edit),
        
        onPressed: (){
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCTS_FORM,
              arguments: product,
            );}
      ),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed:(){
          showDialog<bool>(
          context:context,
          builder: (ctx)=>AlertDialog(
            title: Text('Tem certeza que deseja excluir o produto?'),
            content: Text('O producto será excluido permanentemente.'),
            actions:[
              TextButton(onPressed: (){
                Navigator.of(ctx).pop(false);
              }, child: Text('Não')),
              TextButton(onPressed: (){
                Navigator.of(ctx).pop(true);
                Provider.of<ProductList>(context,listen: false).removeProduct(product);
              }, child: Text('Sim'))
            ]

          )
        );
         
        }
      ),
          ]
        ))
    );
  }
}