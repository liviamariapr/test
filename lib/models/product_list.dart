import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store/data/dummy_data.dart';
import 'package:store/models/product.dart';

class ProductList with ChangeNotifier{
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
 
  List<Product> get favorite => _items.where((prod)=> prod.isFavorite).toList();

  void add (Product product){
    _items.add(product);
    notifyListeners();
  }
  
   void updateProduct(Product product){
      int index =_items.indexWhere((p)=>p.id ==product.id);

      if(index>=0){
        _items[index]=product;
        notifyListeners();
      }
    }

   void removeProduct(Product product){
      int index =_items.indexWhere((p)=>p.id ==product.id);

      if(index>=0){
        _items.removeWhere((p)=>p.id==product.id);
        notifyListeners();
      }
    }
 
   void saveProduct (Map<String,Object> data){
    bool hasId =data['id'] !=null;

     final newProduct = Product(
      id: hasId? data['id'] as String: Random().nextDouble.toString(),
      title: data['name'] as String,
      description:data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if(hasId){
      updateProduct(newProduct);
    } else{
       add(newProduct);
    }
   }
   
  }

