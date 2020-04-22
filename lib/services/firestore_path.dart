class FirestorePath {
  static String patients() => 'patients';
  static String sessions() => 'sessions';
  
  
  
  
  
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