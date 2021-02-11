class NominatimModel {
  int placeId;
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
    this.licence,
    this.osmType,
    this.osmId,
    this.boundingbox,
    this.lat,
    this.lon,
    this.displayName,
    this.clas,
    this.type,
    this.importance,
  });

  NominatimModel.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    licence = json['licence'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    boundingbox = json['boundingbox'].cast<String>();
    lat = json['lat'];
    lon = json['lon'];
    displayName = json['display_name'];
    clas = json['class'];
    type = json['type'];
    importance = json['importance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['licence'] = this.licence;
    data['osm_type'] = this.osmType;
    data['osm_id'] = this.osmId;
    data['boundingbox'] = this.boundingbox;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['display_name'] = this.displayName;
    data['class'] = this.clas;
    data['type'] = this.type;
    data['importance'] = this.importance;
    return data;
  }
}
