import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/home/home_controller.dart';
import 'package:ponto_diario/app/modules/home/local_components/initial_page.dart';
import 'package:ponto_diario/app/modules/home/local_components/settings_page.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: settingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: '',
          ),
        ],
        currentIndex: controller.selectedIndex,
        onTap: controller.onTapped,
      ),
    );
  }
}
