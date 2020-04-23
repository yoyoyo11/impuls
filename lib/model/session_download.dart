class SessionDownload {
  SessionDownload({
    this.id,
    this.sac,
    this.sessionDate,
    this.stimFreq,
    this.percentHTT,
    this.percentTT,
    this.moodleFlag,
    this.moodleFlagDatestamp,
    this.downloadDatestamp,
    this.patientId,
    this.lastSBP,
    this.lastDBP,
    this.lastBRS,
    this.sessionNumber,
  });
  final String id;
  final int sac;
  final DateTime sessionDate;
  final int stimFreq;
  final int percentHTT;
  final int percentTT;
  final int moodleFlag; //bool?
  final DateTime moodleFlagDatestamp;
  final DateTime downloadDatestamp;
  final String patientId;
  final double lastSBP;
  final double lastDBP;
  final double lastBRS;
  final int sessionNumber;

  factory SessionDownload.fromMap(Map<dynamic, dynamic> value, String id) {
    if (value == null) {
      return null;
    }
    final String id = value['id'];
    if (id == null) {
      return null;
    }
    final int sac = value['sac'];
    if (sac == null) {
      return null;
    }
    final DateTime sessionDate = value['sessionDate'];
    if (sessionDate == null) {
      return null;
    }
    final int stimFreq = value['stimFreq'];
    if (stimFreq == null) {
      return null;
    }
    final int percentHTT = value['percentHTT'];
    if (percentHTT == null) {
      return null;
    }
    final int percentTT = value['percentTT'];
    if (percentTT == null) {
      return null;
    }
    final int moodleFlag = value['moodleFlag'];
    if (moodleFlag == null) {
      return null;
    }
    final DateTime moodleFlagDateStamp = value['moodleFlagDateStamp'];
    if (moodleFlagDateStamp == null) {
      return null;
    }
    final DateTime downloadDateStamp = value['downloadDateStamp'];
    if (downloadDateStamp == null) {
      return null;
    }
    final String patientId = value['patientId'];
    if (patientId == null) {
      return null;
    }
    final double lastSBP = value['lastSBP'];
    if (lastSBP == null) {
      return null;
    }
    final double lastDBP = value['lastDBP'];
    if (lastDBP == null) {
      return null;
    }
    final double lastBRS = value['lastBRS'];
    if (lastBRS == null) {
      return null;
    }
    final int sessionNumber = value['sessionNumber'];
    if (sessionNumber == null) {
      return null;
    }
    return SessionDownload(
      id: value['id'],
      sac: value['sac'],
      sessionDate: value['sessionDate'],
      stimFreq: value['stimFreq'],
      percentHTT: value['percentHTT'],
      percentTT: value['percentTT'],
      moodleFlag: value['moodleFlag'],
      moodleFlagDatestamp: value['moodleFlagDatestamp'],
      downloadDatestamp: value['downloadDatestamp'],
      patientId: value['patientId'],
      lastSBP: value['lastSBP'],
      lastDBP: value['lastDBP'],
      lastBRS: value['lastBRS'],
      sessionNumber: value['sessionNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sac': sac,
      'sessionDate': sessionDate,
      'stimFreq': stimFreq,
      'percentHTT': percentHTT,
      'percentTT': percentTT,
      'moodleFlag':moodleFlag,
      'moodleFlagDatestamp': moodleFlagDatestamp,
      'downloadDatestamp': downloadDatestamp,
      'patientId': patientId,
      'lastSBP': lastSBP,
      'lastDBP': lastDBP,
      'lastBRS': lastBRS,
      'sessionNumber': sessionNumber,
    };
  }
}
