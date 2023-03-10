import 'package:Order_Book/AreaDropDown.dart';
import 'package:Order_Book/splashScreen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(OrderBook());
}
class OrderBook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: Scaffold(     body: SplashScreen(),
    ),);
    
  }
}