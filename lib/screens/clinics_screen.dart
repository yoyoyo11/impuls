import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:implulsnew/model/clinic.dart';
import 'package:implulsnew/screens/add_clinic_screen.dart';
import 'package:implulsnew/services/firestore_database_service.dart';
import 'package:implulsnew/widgets/list_items_builder.dart';
import 'package:provider/provider.dart';

class ClinicsScreen extends StatefulWidget {
  @override
  _ClinicsScreenState createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  @override
  Widget build(BuildContext context) {
    final database =
        Provider.of<FirestoreDatabaseService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Clinics'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddClinicScreen(),
            ),
          );
        },
      ),
      body: Container(
        child: Center(
          child: StreamBuilder<List<Clinic>>(
            stream: database.clinicsStream(),
            builder: (context, snapshot) {
              return ListItemsBuilder<Clinic>(
                snapshot: snapshot,
                itemBuilder: (context, clinic) => Dismissible(
                  key: Key('clinic-${clinic.id}'),
                  background: Container(color: Colors.red),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) => _delete(context, clinic),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text('${clinic.name}',
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

  Future<void> _delete(BuildContext context, Clinic clinic) async {
    try {
      final database = Provider.of<FirestoreDatabaseService>(context);
      await database.deleteClinic(clinic);
    } on PlatformException catch (e) {
      print(e);
      // PlatformExceptionAlertDialog(
      //   title: 'Operation failed',
      //   exception: e,
      // ).show(context);
    }
  }
}
