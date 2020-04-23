import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:implulsnew/model/address.dart';
import 'package:implulsnew/model/clinic.dart';
import 'package:implulsnew/services/firestore_database_service.dart';
import 'package:provider/provider.dart';

class AddTherapistScreen extends StatefulWidget {
  @override
  _AddTherapistScreenState createState() => _AddTherapistScreenState();
}

class _AddTherapistScreenState extends State<AddTherapistScreen> {
  String name;
  String phone;
  String phone2;
  Address address;
  String email;
  String manager;
  String notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Therapist'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                Text('Therapist Info',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                // SizedBox(height: 20.0),
                // TextField(
                //   textCapitalization: TextCapitalization.words,
                //   decoration: InputDecoration(labelText: 'Clinic Name'),
                //   onChanged: (newName) {
                //     name = newName;
                //   },
                // ),
                // TextField(
                //   keyboardType: TextInputType.phone,
                //   decoration: InputDecoration(labelText: 'Phone 1'),
                //   onChanged: (newPhone1) {
                //     phone = newPhone1;
                //   },
                // ),
                // TextField(
                //   keyboardType: TextInputType.phone,
                //   decoration: InputDecoration(labelText: 'Phone 2'),
                //   onChanged: (newPhone2) {
                //     phone2 = newPhone2;
                //   },
                // ),
                // TextField(
                //   keyboardType: TextInputType.emailAddress,
                //   decoration: InputDecoration(labelText: 'Email'),
                //   onChanged: (newEmail) {
                //     email = newEmail;
                //   },
                // ),
                // TextField(
                //   //keyboardType: TextInputType.emailAddress,
                //   textCapitalization: TextCapitalization.words,
                //   decoration: InputDecoration(labelText: 'Manager'),
                //   onChanged: (newManager) {
                //     manager = newManager;
                //   },
                // ),
                // TextField(
                //   //keyboardType: TextInputType.emailAddress,
                //   maxLines: 6,
                //   textCapitalization: TextCapitalization.sentences,
                //   decoration: InputDecoration(labelText: 'Notes'),
                //   onChanged: (newNotes) {
                //     notes = newNotes;
                //   },
                // ),
                // RaisedButton(
                //   child: Text('Save'),
                //   onPressed: () {
                //     final clinic = Clinic(
                //       name: name,
                //       phone: phone,
                //       phone2: phone2,
                //       email: email,
                //       manager: manager,
                //       notes: notes,
                //     );
                //     _submit(clinic);
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(Clinic clinic) async {
    try {
      final database =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
      await database.setClinic(clinic: clinic).whenComplete(() {
        print('Clinic saved into db');
        Navigator.pop(context);
      });
    } on PlatformException catch (e) {
      print(e);
      // PlatformExceptionAlertDialog(
      //   title: 'Operation failed',
      //   exception: e,
      // ).show(context);
    }
  }
}
