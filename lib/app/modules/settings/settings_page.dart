import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ponto_diario/app/modules/settings/settings_controller.dart';
import 'package:ponto_diario/app/modules/settings/settings_state.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SettingsController>();
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
                controller: cubit.streetController,
                onSubmitted: cubit.getAddressInfo,
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
              child: BlocBuilder<SettingsController, SettingsState>(
                builder: (context, state) {
                  if (state is SettingsLoaded) {
                    if (state.addressData.isNotEmpty) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.addressData?.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.addressData![i].displayName),
                                  SizedBox(height: 10.0),
                                  Text(
                                      'Latitude: ' + state.addressData![i].lat),
                                  SizedBox(height: 10.0),
                                  Text('Longitude: ' +
                                      state.addressData![i].lon),
                                  SizedBox(height: 10.0),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit
                                            .registerWorkLocation(
                                              state.addressData[i].lat,
                                              state.addressData[i].lon,
                                            )
                                            .then((value) =>
                                                Navigator.pop(context));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                      );
                    }
                  } else {
                    return Center(
                      child: Text('Nenhum endereço encontrado'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
