class Device {
  Device({
    this.id,
    this.version,
    this.manDate,
    this.shipDate,
    this.tabletID,
    this.firmwareVersion,
    this.tabletSoftwareVersion,
  });
  final String id;
  final String version;
  final DateTime manDate;
  final DateTime shipDate;
  final String tabletID;
  final String firmwareVersion;
  final String tabletSoftwareVersion;

  factory Device.fromMap(Map<dynamic, dynamic> value, String id) {
    if (value == null) {
      return null;
    }
    final String id = value['id'];
    if (id == null) {
      return null;
    }
    final String version = value['version'];
    if (version == null) {
      return null;
    }
    final DateTime manDate = value['manDate'];
    if (manDate == null) {
      return null;
    }
    final DateTime shipDate = value['shipDate'];
    if (shipDate == null) {
      return null;
    }
    final String tabletID = value['tabletID'];
    if (tabletID == null) {
      return null;
    }
    final String firmwareVersion = value['firmwareVersion'];
    if (firmwareVersion == null) {
      return null;
    }
    final String tabletSoftwareVersion = value['tabletSoftwareVersion'];
    if (tabletSoftwareVersion == null) {
      return null;
    }
    return Device(
      id: value['id'],
      version: value['version'],
      manDate: value['manDate'],
      shipDate: value['shipDate'],
      tabletID: value['tabletID'],
      firmwareVersion: value['firmwareVersion'],
      tabletSoftwareVersion: value['tabletSoftwareVersion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'version': version,
      'manDate': manDate,
      'shipDate': shipDate,
      'tabletID': tabletID,
      'firmwareVersion': firmwareVersion,
      'tabletSoftwareVersion': tabletSoftwareVersion,
    };
  }
}
