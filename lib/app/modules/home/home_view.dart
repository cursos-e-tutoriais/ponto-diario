import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:ponto_diario/app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(-23.5677666, -46.6487763),
          zoom: 17.0
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: controller.urlMap,
            subdomains: controller.subdomains
          ),
          /* MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: latLng.LatLng(-23.5677666, -46.6487763),
                builder: (_) => Container(
                  child: FlutterLogo(),
                )
              )
            ]
          ) */
        ],
      ),
    );
  }
}
