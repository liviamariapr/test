import 'package:flutter/material.dart';
import 'package:store/models/product.dart';

class ProductDetail extends StatelessWidget {
  
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
                ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title,
        textAlign: TextAlign.center)
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height:300,
                width:double.infinity,
                child: Image.network(product.imageUrl,
                fit: BoxFit.cover),
              ),
              SizedBox(height: 10,),
              Text('R\$ ${product.price}'),
               SizedBox(height: 10,),
              Text(product.description,
              textAlign: TextAlign.center)
            ],
        ),
      )
    );
  }
}