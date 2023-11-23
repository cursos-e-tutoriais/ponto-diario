class NominatimModel {
  int? placeId;
  String licence;
  String osmType;
  int osmId;
  List<String> boundingbox;
  String lat;
  String lon;
  String displayName;
  String clas;
  String type;
  double importance;

  NominatimModel({
    this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.boundingbox,
    required this.lat,
    required this.lon,
    required this.displayName,
    required this.clas,
    required this.type,
    required this.importance,
  });

  NominatimModel.fromJson(Map<String, dynamic> json)
      : placeId = json['place_id'],
        licence = json['licence'],
        osmType = json['osm_type'],
        osmId = json['osm_id'],
        boundingbox = List<String>.from(json['boundingbox']),
        lat = json['lat'],
        lon = json['lon'],
        displayName = json['display_name'],
        clas = json['class'],
        type = json['type'],
        importance = json['importance'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['place_id'] = placeId;
    data['licence'] = licence;
    data['osm_type'] = osmType;
    data['osm_id'] = osmId;
    data['boundingbox'] = boundingbox;
    data['lat'] = lat;
    data['lon'] = lon;
    data['display_name'] = displayName;
    data['class'] = clas;
    data['type'] = type;
    data['importance'] = importance;
    return data;
  }
}
