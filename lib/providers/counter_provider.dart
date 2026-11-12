import 'package:flutter/widgets.dart';

class CounterState {
  int _value=0;

  void add () => _value++;
  void dim () => _value--;
  int get value => _value;
  bool diff (CounterState old){
    return old._value!=_value;
  }
}
class CounterProvider extends InheritedWidget {
  final CounterState state = CounterState();
  CounterProvider({required Widget child}): super(child:child);

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget){
    return oldWidget.state.diff(state);
  }
 
  static CounterProvider? of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

}
