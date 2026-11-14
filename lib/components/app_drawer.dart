import 'package:flutter/material.dart';
import 'package:store/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text ('Bem vido usuario!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Loja'),
            onTap: ()
            {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.HOME,);
            }
                      ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payments),
            title: Text('Meus Pedidos'),
            onTap: ()
            {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ORDERS,);
            }
                      ),
             Divider(),
          ListTile(
            leading: Icon(Icons.payments),
            title: Text('Gerenciar Productos'),
            onTap: ()
            {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.PRODUCTS,);
            }
                      )


        ],
      )
    );
  }
}