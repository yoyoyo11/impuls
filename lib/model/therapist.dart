import 'package:implulsnew/model/clinic.dart';
import 'package:implulsnew/model/user.dart';

class Therapist extends User {
  Therapist({
    this.id,
    this.userId,
    this.clinic,
    this.token,
    this.notes,
  });
  final String id;
  final String userId;
  final Clinic clinic;
  final String token;
  final String notes;

   factory Therapist.fromMap(Map<dynamic, dynamic> value, String id) {
    if (value == null) {
      return null;
    }
    final String id = value['id'];
    if (id == null) {
      return null;
    }
    final String userId = value['userId'];
    if (userId == null) {
      return null;
    }
    final Clinic clinic = value['clinic'];
    if (clinic == null) {
      return null;
    }
    final String token = value['token'];
    if (token == null) {
      return null;
    }
    final String notes = value['notes'];
    if (notes == null) {
      return null;
    }
    
    return Therapist(
      id: value['id'],
      userId: value['userId'],
      clinic: value['clinic'],
      token: value['token'],
      notes: value['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'clinic': clinic,
      'token': token,
      'notes': notes,
    };
  }

}
