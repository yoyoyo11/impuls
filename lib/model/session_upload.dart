class SessionUpload {
  SessionUpload({
    this.id,
    this.sessionUploadDatestamp,
    this.initialPain,
    this.sensoryA1,
    this.painOnsetA1,
    this.toleranceA1,
    this.sensoryA2,
    this.painOnsetA2,
    this.toleranceA2,
    this.sensoryB1,
    this.painOnsetB1,
    this.toleranceB1,
    this.sensoryB2,
    this.painOnsetB2,
    this.toleranceB2,
    this.finalPain,
    this.sessionNotes,
    this.moodleConfirmFlag,
    this.moodleFlagDatestamp,
    this.uploadDatestamp,
    this.deviceGeo,
  });
  final String id;
  final DateTime sessionUploadDatestamp;
  final int initialPain;
  final int sensoryA1;
  final int painOnsetA1;
  final int toleranceA1;
  final int sensoryA2;
  final int painOnsetA2;
  final int toleranceA2;
  final int sensoryB1;
  final int painOnsetB1;
  final int toleranceB1;
  final int sensoryB2;
  final int painOnsetB2;
  final int toleranceB2;
  final int finalPain;
  final String sessionNotes;
  final int moodleConfirmFlag; //bool?
  final DateTime moodleFlagDatestamp;
  final DateTime uploadDatestamp;
  final String deviceGeo;

  factory SessionUpload.fromMap(Map<dynamic, dynamic> value, String id) {
    if (value == null) {
      return null;
    }
    final String id = value['id'];
    if (id == null) {
      return null;
    }
    final DateTime sessionUploadDatestamp = value['sessionUploadDatestamp'];
    if (sessionUploadDatestamp == null) {
      return null;
    }
    final int initialPain = value['initialPain'];
    if (initialPain == null) {
      return null;
    }

    final int sensoryA1 = value['sensoryA1'];
    if (sensoryA1 == null) {
      return null;
    }
    final int painOnsetA1 = value['painOnsetA1'];
    if (painOnsetA1 == null) {
      return null;
    }
    final int toleranceA1 = value['toleranceA1'];
    if (toleranceA1 == null) {
      return null;
    }

    final int sensoryA2 = value['sensoryA2'];
    if (sensoryA2 == null) {
      return null;
    }
    final int painOnsetA2 = value['painOnsetA2'];
    if (painOnsetA2 == null) {
      return null;
    }
    final int toleranceA2 = value['toleranceA2'];
    if (toleranceA2 == null) {
      return null;
    }
    final int sensoryB1 = value['sensoryB1'];
    if (sensoryB1 == null) {
      return null;
    }
    final int painOnsetB1 = value['painOnsetB1'];
    if (painOnsetB1 == null) {
      return null;
    }
    final int toleranceB1 = value['toleranceB1'];
    if (toleranceB1 == null) {
      return null;
    }
    final int sensoryB2 = value['sensoryB2'];
    if (sensoryB2 == null) {
      return null;
    }
    final int painOnsetB2 = value['painOnsetB2'];
    if (painOnsetB2 == null) {
      return null;
    }
    final int toleranceB2 = value['toleranceB2'];
    if (toleranceB2 == null) {
      return null;
    }
    final int finalPain = value['finalPain'];
    if (finalPain == null) {
      return null;
    }
    final String sessionNotes = value['sessionNotes'];
    if (sessionNotes == null) {
      return null;
    }
    final int moodleConfirmFlag = value['moodleConfirmFlag'];
    if (moodleConfirmFlag == null) {
      return null;
    }
    final DateTime moodleFlagDatestamp = value['moodleFlagDatestamp'];
    if (moodleFlagDatestamp == null) {
      return null;
    }
    final DateTime uploadDatestamp = value['uploadDatestamp'];
    if (uploadDatestamp == null) {
      return null;
    }
    final String deviceGeo = value['deviceGeo'];
    if (deviceGeo == null) {
      return null;
    }
    return SessionUpload(
      id: value['id'],
      sessionUploadDatestamp: value['sessionUploadDatestamp'],
      initialPain: value['initialPain'],
      sensoryA1: value['sensoryA1'],
      painOnsetA1: value['painOnsetA1'],
      toleranceA1: value['toleranceA1'],
      sensoryA2: value['sensoryA2'],
      painOnsetA2: value['painOnsetA2'],
      toleranceA2: value['toleranceA2'],
      sensoryB1: value['sensoryB1'],
      painOnsetB1: value['painOnsetB1'],
      toleranceB1: value['toleranceB1'],
      sensoryB2: value['sensoryB2'],
      painOnsetB2: value['painOnsetB2'],
      toleranceB2: value['toleranceB2'],
      finalPain: value['finalPain'],
      sessionNotes: value['sessionNotes'],
      moodleConfirmFlag: value['moodleConfirmFlag'],
      moodleFlagDatestamp: value['moodleFlagDatestamp'],
      uploadDatestamp: value['uploadDatestamp'],
      deviceGeo: value['deviceGeo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sessionUploadDatestamp': sessionUploadDatestamp,
      'initialPain': initialPain,
      'sensoryA1': sensoryA1,
      'painOnsetA1': painOnsetA1,
      'toleranceA1': toleranceA1,
      'sensoryA2': sensoryA2,
      'painOnsetA2': painOnsetA2,
      'toleranceA2': toleranceA2,
      'sensoryB1': sensoryB1,
      'painOnsetB1': painOnsetB1,
      'toleranceB1': toleranceB1,
      'sensoryB2': sensoryB2,
      'painOnsetB2': painOnsetB2,
      'toleranceB2': toleranceB2,
      'finalPain': finalPain,
      'sessionNotes': sessionNotes,
      'moodleConfirmFlag': moodleConfirmFlag,
      'moodleFlagDatestamp': moodleFlagDatestamp,
      'uploadDatestamp': uploadDatestamp,
      'deviceGeo': deviceGeo,
    };
  }
}
