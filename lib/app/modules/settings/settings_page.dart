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
                  labelText: 'Rua de exemplo',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: controller.obx(
                (_) => ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _?.obs.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_!.obs[i].displayName),
                            SizedBox(height: 10.0),
                            Text('Latitude: ' + _.obs[i].lat),
                            SizedBox(height: 10.0),
                            Text('Longitude: ' + _.obs[i].lon),
                            SizedBox(height: 10.0),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  controller.registerWorkLocation(
                                    _.obs[i].lat,
                                    _.obs[i].lon,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Usar este endereço!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
