import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ponto_diario/app/modules/settings/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Text('Pesquise o seu endereço'),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: controller.streetController,
                onEditingComplete: () {
                  controller.getAddressInfo(controller.streetController.text);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            controller.obx(
              (_) => Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(_.first.licence),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
