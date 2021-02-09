import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView{
  @override 
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.green,
      child: Center(
        child: Text(
          'Ponto Diário',
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.1,
          ),
        ),
      )
    );
  }
}