import 'package:flutter/material.dart';

class ShoppingCarDetail extends StatelessWidget {
  final String value;
  final Colors? color;
  final Widget child;
  const ShoppingCarDetail({required this.value,
   required this.child,
   this.color, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 1,
          top:1,
          child:Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.secondary,
            ),
            constraints: BoxConstraints(
              minHeight: 2,
              minWidth: 2
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize:15,
              )
            )
          ),
        ),
      ],

    );
  }
}