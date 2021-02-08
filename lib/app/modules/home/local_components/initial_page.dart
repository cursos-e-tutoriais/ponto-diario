import 'package:flutter/material.dart';

Widget initialPage(context) {
  return Stack(
    children: [
      Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
                title: Text('INÍCIO'),
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text('Bem Vindo! João',
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
              Text('Segunda, 10 de Janeiro de 2017',
                  style: TextStyle(fontSize: 15.0, color: Colors.white)),
            ],
          ),
        ),
      ),
    ],
  );
}
