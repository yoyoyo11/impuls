import 'dart:async';
import 'dart:math';
import 'package:implulsnew/model/clinic.dart';
import 'package:implulsnew/model/patient.dart';
import 'package:implulsnew/model/therapist.dart';
import 'package:meta/meta.dart';
// import 'package:implulsnew/models/job.dart';
// import 'package:implulsnew/models/user.dart' as u;
// import 'package:implulsnew/models/user_info.dart';
import 'package:implulsnew/services/firestore_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabaseService {
  FirestoreDatabaseService({@required this.uid}) : assert(uid != null);
  final String uid;

  // USER -------------------------
  Future<void> setNewUser(String userRole) async => await setData(
        path: FirestorePath.user(uid),
        data: {
          'userRole': userRole,
          'questionsRemaining': ['Intro', 'Team', 'Math', 'Read', 'Conflict']
        },
      );

  Future<String> getUserRole() async {
    String userRole;
    var userQuery = Firestore.instance.collection('users').document('$uid');
    await userQuery.get().then((data) {
      if (data != null) {
        userRole = data['userRole'];
      }
    });
    return userRole;
  }

  Future<DocumentSnapshot> getFirestoreUserInfo() async {
    String path = FirestorePath.user(uid);
    return await getDocument(path: path);
  }

  Future<DocumentSnapshot> getRecipientUserInfo(String recipientId) async {
    String path = FirestorePath.user(recipientId);
    return await getDocument(path: path);
  }

  // CLINICS -------------------------
  Future<void> setClinic({Clinic clinic}) async {
    await setDataAutoGenAndStoreId(
      path: FirestorePath.clinics(),
      data: clinic.toMap(),
    );
  }

  Stream<List<Clinic>> clinicsStream() => collectionStream(
        path: FirestorePath.clinics(),
        builder: (data, documentId) => Clinic.fromMap(data, documentId),
        sort: (lhs, rhs) => lhs.name.compareTo(rhs.name),
      );

  Future<void> deleteClinic(Clinic clinic) async {
    // delete Clinic
    await deleteData(path: FirestorePath.clinicById(clinic.id)).whenComplete(
      () {
        print('Successfully deleted ${clinic.name} with ID ${clinic.id}');
      },
    );
  }

  // THERAPISTS ----------------------
  Future<void> setTherapist({Therapist therapist}) async {
    await setDataAutoGenAndStoreId(
      path: FirestorePath.therapists(),
      data: therapist.toMap(),
    );
  }

  Stream<List<Therapist>> therapistsStream() => collectionStream(
        path: FirestorePath.therapists(),
        builder: (data, documentId) => Therapist.fromMap(data, documentId),
        sort: (lhs, rhs) => lhs.lastName.compareTo(rhs.lastName),
      );

  Future<void> deleteTherapist(Therapist therapist) async {
    // delete Clinic
    await deleteData(path: FirestorePath.therapistById(therapist.id)).whenComplete(
      () {
        print('Successfully deleted ${therapist.firstName} ${therapist.lastName} with ID ${therapist.id}');
      },
    );
  }

  // PATIENTS ------------------------
   Future<void> setPatient({Patient patient}) async {
    await setDataAutoGenAndStoreId(
      path: FirestorePath.patients(),
      data: patient.toMap(),
    );
  }

  Stream<List<Patient>> patientsStream() => collectionStream(
        path: FirestorePath.patients(),
        builder: (data, documentId) => Patient.fromMap(data, documentId),
        sort: (lhs, rhs) => lhs.lastName.compareTo(rhs.lastName),
      );

  Future<void> deletePatient(Patient patient) async {
    // delete Clinic
    await deleteData(path: FirestorePath.patientById(patient.id)).whenComplete(
      () {
        print('Successfully deleted ${patient.firstName} ${patient.lastName} with ID ${patient.id}');
      },
    );
  }

  // DEVICES -------------------------

  // SESSION DOWNLOADS ---------------

  // SESSION UPLOADS -----------------

  // // JOBS -------------------------
  // Future<String> setJobByUserAndBusiness({Job job, String businessId}) async {
  //   // First, need to add uid as creatorId
  //   Map<String, dynamic> jobTemp = job.toMap();
  //   jobTemp.addAll({'creatorId': uid});

  //   // Then, set job by user and return jobId
  //   String jobId = await setDataAutoGenIdReturnId(
  //     path: FirestorePath.jobs(),
  //     //data: job.toMap(),
  //     data: jobTemp,
  //   );
  //   // Then, add retrieved JobId to Map
  //   Map<String, dynamic> updatedMapWithId = job.toMap();
  //   updatedMapWithId.addAll({'id': jobId});
  //   // Then, set job by business
  //   await setData(
  //     path: FirestorePath.businessesJobWithId(businessId, jobId),
  //     data: updatedMapWithId,
  //   );
  //   return jobId;
  // }

  // //YO: THIS ISN'T COMPLETE YET BECAUSE OF THE ENTRY STUFF
  // Future<void> deleteJob(Job job) async {
  //   // Jobs are set in 2 places: 'jobs/$jobId' and 'businesses/$businessId/job/$jobId'
  //   // TODO: YO This for loop is still broken... need to fix!!!
  //   final allEntries = await entriesStream(job: job).first;
  //   for (Entry entry in allEntries) {
  //     if (entry.jobId == job.id) {
  //       await deleteEntry(entry);
  //     }
  //   }
  //   // delete job
  //   await deleteData(path: FirestorePath.jobById(job.id));

  //   //TODO: YO - Need to figure out how to delete by businessid
  //   // final pathBusinessIdJobId =
  //   //     FirestorePath.businessesJobWithId(businessId, job.id);
  //   // final referenceBusinessIdJobId =
  //   //     Firestore.instance.document(pathBusinessIdJobId);
  //   // print('delete: $pathBusinessIdJobId');
  //   // await referenceBusinessIdJobId.delete();
  // }

  // Stream<List<Job>> jobsStream() => collectionStream(
  //       path: FirestorePath.jobs(),
  //       builder: (data, documentId) => Job.fromMap(data, documentId),
  //     );

  // Stream<List<Job>> jobsByCreatorStream() => collectionStream(
  //       path: FirestorePath.jobs(),
  //       queryBuilder: uid != null
  //           ? (query) => query.where('creatorId', isEqualTo: uid)
  //           : null,
  //       builder: (data, documentId) => Job.fromMap(data, documentId),
  //     );

  Future<void> setLikeByJob(String jobId) async => await setArrayData(
        path: FirestorePath.jobById(jobId),
        data: {'likedBy': uid},
      );

  // Future<Job> getJobInfo(String jobId) async {
  //   String path = FirestorePath.jobById(jobId);
  //   Job job;
  //   await getDocument(path: path).then((snapshot){
  //     job = Job(
  //       title: snapshot.data['title'],
  //       status: snapshot.data['status'],
  //       businessName: snapshot.data['businessName'],
  //       businessFormattedAddress: snapshot.data['businessFormattedAddress'],
  //       ratePerHour: snapshot.data['ratePerHour'],
  //       description: snapshot.data['description'],
  //       responsibilities: snapshot.data['responsibilities'],
  //       benefits: snapshot.data['benefits'],
  //       additionalInfo: snapshot.data['additionalInfo'],
  //       creatorId: snapshot.data['creatorId'],
  //     );
  //   });
  //   return job;
  // }

// GENERIC HELPERS // GENERIC HELPERS // GENERIC HELPERS // GENERIC HELPERS // GENERIC HELPERS //
  Future<void> setDataAutoGenAndStoreId({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = Firestore.instance.collection(path).document();
    String id = reference.documentID;
    data.addAll({'id': id});
    await reference.setData(data);
  }

  Future<String> setDataAutoGenIdReturnId({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = Firestore.instance.collection(path).document();
    print('$path: $data');
    // Add auto generated documentId
    String id = reference.documentID;
    data.addAll({'id': id});
    await reference.setData(data);
    return id;
  }

  Future<void> setData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    await reference.setData(data);
  }

  Future<void> updateData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    await reference.updateData(data);
  }

  Future<void> setArrayData({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    DocumentSnapshot doc = await reference.get();
    List snapshotList = doc.data[data.keys.first];
    if (snapshotList == null) {
      await reference.updateData({
        data.keys.first: FieldValue.arrayUnion([data[data.keys.first]])
      });
    } else {
      if (snapshotList.contains(data[data.keys.first]) == true) {
        // User just unliked so need to remove from Firestore array field called 'likedBy'
        await reference.updateData({
          data.keys.first: FieldValue.arrayRemove([data[data.keys.first]])
        });
      } else {
        // User just liked so update Firestore array field called 'likedBy'
        await reference.updateData({
          data.keys.first: FieldValue.arrayUnion([data[data.keys.first]])
        });
      }
    }
  }

  Future<void> setDataAutoGenId({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    //final reference = Firestore.instance.document(path);
    final reference = Firestore.instance.collection(path).document();
    print('$path: $data');
    await reference.setData(data);
  }

  Future<void> deleteData({@required String path}) async {
    final reference = Firestore.instance.document(path);
    print('delete: $path');
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) {
    Query query = Firestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.documents
          .map((snapshot) => builder(snapshot.data, snapshot.documentID))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentID),
  }) {
    final DocumentReference reference = Firestore.instance.document(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots
        .map((snapshot) => builder(snapshot.data, snapshot.documentID));
  }

  Future<QuerySnapshot> getDocuments({
    @required String path,
    Query queryBuilder(Query query),
  }) {
    Query query = Firestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    return query.getDocuments();
  }

  Future<DocumentSnapshot> getDocument({
    @required String path,
  }) async {
    // This reference points to the document based on the path parameter received
    final reference = Firestore.instance.document(path);

    // Create local DocumentSnapshot
    DocumentSnapshot snapshot = await reference.get();

    return snapshot;
  }
}
