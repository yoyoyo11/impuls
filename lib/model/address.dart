class Address {
  Address({
    this.floor,
    this.streetNumber,
    this.route,
    this.neighborhood,
    this.locality,
    this.postalCode,
    this.postalCodeSuffix,
    this.adminAreaLevel1,
    this.adminAreaLevel2,
    this.country,
    this.lat,
    this.lng,
    this.googlePlaceId,
    this.formattedAddress,
  });

  String floor;
  String streetNumber;
  String route;
  String neighborhood;
  String locality;
  String postalCode;
  String postalCodeSuffix;
  String adminAreaLevel1;
  String adminAreaLevel2;
  String country;
  String lat;
  String lng;
  String googlePlaceId;
  String formattedAddress;

  factory Address.fromMap(Map<dynamic, dynamic> value, String id) {
    return Address(
      floor: value['floor'],
      streetNumber: value['streetNumber'],
      route: value['route'],
      neighborhood: value['neighborhood'],
      locality: value['locality'],
      postalCode: value['postalCode'],
      postalCodeSuffix: value['postalCodeSuffix'],
      adminAreaLevel1: value['adminAreaLevel1'],
      adminAreaLevel2: value['adminAreaLevel2'],
      country: value['country'],
      lat: value['lat'],
      lng: value['lng'],
      googlePlaceId: value['googlePlaceId'],
      formattedAddress: value['formattedAddress'],
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'floor': floor,
  //     'streetNumber': streetNumber,
  //     'route': route,
  //     'neighborhood': neighborhood,
  //     'locality': locality,
  //     'postalCode': postalCode,
  //     'postalCodeSuffix': postalCodeSuffix,
  //     'adminAreaLevel1': adminAreaLevel1,
  //     'adminAreaLevel2': adminAreaLevel2,
  //     'country': country,
  //     'lat': lat,
  //     'lng': lng,
  //     'googlePlaceId': googlePlaceId,
  //     'formattedAddress': formattedAddress,
  //   };
  // }

  Map<String, dynamic> toMap() {
    // This toMap checks to see if value exists. If not, it does not add to map...
    // This implementation is ideal because it doesn't save null in Firestore. 
    Map<String, dynamic> data = {};
    if (floor != null || floor == '') {
      data.addAll({'floor': floor});
    }
    if (streetNumber != null) {
      data.addAll({'streetNumber': streetNumber});
    }
    if (route != null) {
      data.addAll({'route': route});
    }
    if (neighborhood != null) {
      data.addAll({'neighborhood': neighborhood});
    }
    if (locality != null) {
      data.addAll({'locality': locality});
    }
    if (postalCode != null) {
      data.addAll({'postalCode': postalCode});
    }
    if (postalCodeSuffix != null) {
      data.addAll({'postalCodeSuffix': postalCodeSuffix});
    }
    if (adminAreaLevel1 != null) {
      data.addAll({'adminAreaLevel1': adminAreaLevel1});
    }
    if (adminAreaLevel2 != null) {
      data.addAll({'adminAreaLevel2': adminAreaLevel2});
    }
    if (country != null) {
      data.addAll({'country': country});
    }
    if (lat != null) {
      data.addAll({'lat': lat});
    }
    if (lng != null) {
      data.addAll({'lng': lng});
    }
    if (googlePlaceId != null) {
      data.addAll({'googlePlaceId': googlePlaceId});
    }
    if (formattedAddress != null) {
      data.addAll({'formattedAddress': formattedAddress});
    }

    return data;
  }
}
