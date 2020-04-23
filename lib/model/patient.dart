import 'package:implulsnew/model/user.dart';

class Patient extends User {
  Patient({
    this.id,
    this.userId,
    this.sex,
    this.weight,
    this.enrollDate,
    this.birthDate,
    this.currentSession,
    this.primaryD,
    this.secondaryD,
    this.height,
    this.notes,
  });
  final String id;
  final String userId;
  final String sex;
  final double weight;
  final DateTime enrollDate;
  final DateTime birthDate;
  final String currentSession;
  final String primaryD;
  final String secondaryD;
  final double height;
  final String notes;

  factory Patient.fromMap(Map<dynamic, dynamic> value, String id) {
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
    final String sex = value['sex'];
    if (sex == null) {
      return null;
    }
    final double weight = value['weight'];
    if (weight == null) {
      return null;
    }
    final DateTime enrollDate = value['enrollDate'];
    if (enrollDate == null) {
      return null;
    }
    final DateTime birthDate = value['birthDate'];
    if (birthDate == null) {
      return null;
    }
    final String currentSession = value['currentSession'];
    if (currentSession == null) {
      return null;
    }
    final String primaryD = value['primaryD'];
    if (primaryD == null) {
      return null;
    }
    final String secondaryD = value['secondaryD'];
    if (secondaryD == null) {
      return null;
    }
    final double height = value['height'];
    if (height == null) {
      return null;
    }
    final String notes = value['notes'];
    if (notes == null) {
      return null;
    }
    return Patient(
      id: value['id'],
      userId: value['userId'],
      sex: value['sex'],
      weight: value['weight'],
      enrollDate: value['enrollDate'],
      birthDate: value['birthDate'],
      currentSession: value['currentSession'],
      primaryD: value['primaryD'],
      secondaryD: value['secondaryD'],
      height: value['height'],
      notes: value['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'sex': sex,
      'weight': weight,
      'enrollDate': enrollDate,
      'birthDate': birthDate,
      'currentSession': currentSession,
      'primaryD': primaryD,
      'secondaryD': secondaryD,
      'height': height,
      'notes': notes,
    };
  }
}
