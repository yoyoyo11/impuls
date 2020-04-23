class FirestorePath {
  static String clinics() => 'clinics';
  static String clinicById(String clinicId) => 'clinics/$clinicId';
  static String therapists() => 'therapists';
  static String therapistById(String therapistId) => 'therapists/$therapistId';
  static String patients() => 'patients';
  static String patientById(String patientId) => 'patients/$patientId';
  static String devices() => 'devices';
  static String sessionDownloads() => 'sessionDownloads';
  static String sessionUploads() => 'sessionUploads';
  
  
  
  // CLINICS -------------------------

  // THERAPISTS ----------------------

  // PATIENTS ------------------------

  // DEVICES -------------------------

  // SESSION DOWNLOADS ---------------

  // SESSION UPLOADS -----------------

  
  static String businesses() => 'businesses'; 
  static String businessByUser(String uid) => 'users/$uid/business';
  static String usersBusinessWithId(String uid, String businessId) => 'users/$uid/business/$businessId'; 
  static String jobs() => 'jobs';
  static String jobById(String jobId) => 'jobs/$jobId';
  static String businessesJobWithId(String businessId, String jobId) => 'businesses/$businessId/job/$jobId';
  static String user(String uid) => 'users/$uid';
  static String videos() => 'videos';
  static String videoById(String videoId) => 'videos/$videoId';
  static String questions() => 'questions';
  static String messages() => 'messages';
  static String messagesByChatId(String chatId) => 'chats/$chatId/messages';
  static String chats() => 'chats';
  static String chatsById(String chatId) => 'chats/$chatId';
  static String offers() => 'offers';
}