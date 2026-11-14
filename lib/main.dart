import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/cart.dart';
import 'package:store/models/order_list.dart';
import 'package:store/models/product_list.dart';
import 'package:store/pages/cart_page.dart';
import 'package:store/pages/counter_page.dart';
import 'package:store/pages/orders_page.dart';
import 'package:store/pages/product_details.dart';
import 'package:store/pages/product_form.dart';
import 'package:store/pages/product_overview.page.dart';
import 'package:store/pages/product_page.dart';
import 'package:store/providers/counter_provider.dart';
import 'package:store/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> ProductList(),),
         ChangeNotifierProvider(
          create: (_)=> Cart(),),
         ChangeNotifierProvider(
          create: (_)=> OrderList(),),  
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(
            seedColor: const Color.fromARGB(255, 140, 97, 214),
            secondary: Colors.amber,
            primary: const Color.fromARGB(255, 92, 50, 165)),
          
            fontFamily: 'Lato'
        ),
        debugShowCheckedModeBanner: false, 
        routes: {
          AppRoutes.HOME: (cxt) => ProductOvervie(),
          AppRoutes.PRODUCT_DETAIL: (cxt) => ProductDetail(),
          AppRoutes.CART: (cxt)=> CartPage(),
          AppRoutes.ORDERS: (cxt) => OrdersPage(),
          AppRoutes.PRODUCTS: (cxt)=> ProductPage(),
          AppRoutes.PRODUCTS_FORM: (cxt)=> ProductForm()
        }
      ),
    );
  }
}

