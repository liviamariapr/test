import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/components/app_drawer.dart';
import 'package:store/components/product_grid.dart';
import 'package:store/components/shopping_car_detail.dart';
import 'package:store/models/cart.dart';
import 'package:store/utils/app_routes.dart';

enum FilterOption{
      All, 
      Favorite
    }
class ProductOvervie extends StatefulWidget {
  
  ProductOvervie({super.key});

  @override
  State<ProductOvervie> createState() => _ProductOvervieState();
}

class _ProductOvervieState extends State<ProductOvervie> {
  bool _showFavoriteOnly=false;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
            title: Text('Minha Loja'),
            actions: [
              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (_)=>[
                  PopupMenuItem(
                    child: Text('Somente Favoritos'),
                    value: FilterOption.Favorite,
                  ),
                  PopupMenuItem(
                    child: Text('Todos'),
                    value: FilterOption.All,
                  ),
                 
                ],
                  onSelected: (FilterOption selectedValue){
                      setState((){
                      if(selectedValue==FilterOption.Favorite){
                        _showFavoriteOnly=true;
                         
                    } else{
                        _showFavoriteOnly=false;
                    }
                      });
                  }

              ),
              Consumer<Cart>(
                child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed(
                        AppRoutes.CART
                      );
                    },
                    icon: Icon(Icons.shopping_cart)
                  ),
                builder:(ctx,cart,child)=>
                ShoppingCarDetail(
                  value:cart.itemsCount.toString(),
                  child:child!,
                ),
              ),
            ]
           
        ),
        body:  ProductGrid(showFavoriteOnly:_showFavoriteOnly),
        drawer: AppDrawer(),
    );
   
  }
}

