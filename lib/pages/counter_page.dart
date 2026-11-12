import 'package:flutter/material.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/counter_provider.dart';

class CounterPage extends StatefulWidget {
  
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador",
        textAlign: TextAlign.center)
      ),
      body: Column(
        children: [
          
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              setState((){
              CounterProvider.of(context)?.state.add();
              });
              print(CounterProvider.of(context)?.state.value.toString());
            }
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: (){
              setState((){
              CounterProvider.of(context)?.state.dim();
              
            });
            print(CounterProvider.of(context)?.state.value.toString());
            }
          ),
        ],
      )
    );
  }
}