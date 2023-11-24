import 'package:ponto_diario/app/models/nominatim_model.dart';

sealed class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final List<NominatimModel> addressData;

  SettingsLoaded({required this.addressData});
}
