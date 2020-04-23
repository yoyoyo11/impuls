import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:implulsnew/model/patient.dart';
import 'package:implulsnew/screens/add_patient_screen.dart';
import 'package:implulsnew/services/firestore_database_service.dart';
import 'package:implulsnew/widgets/list_items_builder.dart';
import 'package:provider/provider.dart';

class PatientsScreen extends StatefulWidget {
  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    final database =
        Provider.of<FirestoreDatabaseService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Patients'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPatientScreen(),
            ),
          );
        },
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<List<Patient>>(
            stream: database.patientsStream(),
            builder: (context, snapshot) {
              return ListItemsBuilder<Patient>(
                snapshot: snapshot,
                itemBuilder: (context, patient) => Dismissible(
                  key: Key('patient-${patient.id}'),
                  background: Container(color: Colors.red),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => _delete(context, patient),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text('${patient.firstName}',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _delete(BuildContext context, Patient patient) async {
    try {
      final database = Provider.of<FirestoreDatabaseService>(context);
      await database.deletePatient(patient);
    } on PlatformException catch (e) {
      print(e);
      // PlatformExceptionAlertDialog(
      //   title: 'Operation failed',
      //   exception: e,
      // ).show(context);
    }
  }
}