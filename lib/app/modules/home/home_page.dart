import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    const List<Widget> listScreens = [
      Text('Tela Menu'),
      Text('Tela Home'),
      Text('Tela Configurações'),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.22,
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
          GetBuilder<HomeController>(
            builder: (_) => Center(
              child: listScreens.elementAt(_.selectedIndex),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.white),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Configurações',
          ),
        ],
        currentIndex: controller.selectedIndex,
        onTap: controller.onTapped,
      ),
    );
  }
}
