import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:implulsnew/model/clinic.dart';
import 'package:implulsnew/model/patient.dart';
import 'package:implulsnew/services/firestore_database_service.dart';
import 'package:provider/provider.dart';

class AddPatientScreen extends StatefulWidget {
  @override
  _AddPatientScreenState createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  String id;
  String userId;
  String sex;
  double weight;
  DateTime enrollDate;
  DateTime birthDate;
  String currentSession;
  String primaryD;
  String secondaryD;
  double height;
  String notes;
  DateTime _date = DateTime.now();

  Future<Null> selectDate(BuildContext context, String dateType) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _date) {
      if (dateType == 'Enroll Date') {
        setState(() {
          enrollDate = picked;
        });

        // setState(() {
        //   _date = picked;
        //   print(_date.toString());
        // });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Patient'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                Text('Patient Info',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 20.0),
                TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(labelText: 'Sex'),
                  onChanged: (newSex) {
                    sex = newSex;
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'weight'),
                  onChanged: (newWeight) {
                    weight = weight.toDouble();
                  },
                ),
                // TextField(
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(labelText: 'test'),
                //   // onChanged: (newWeight) {
                //   //   weight = weight.toDouble();
                //   // }
                //   onTap: () => selectDate(context, 'Enroll Date')
                // ),
                enrollDate != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Text("${formatDate(
                          //   DateTime(
                          //       birthDate.year, birthDate.month, birthDate.day),
                          //   [MM, ' ', dd, ', ', yyyy],
                          // )}"),
                          Text(
                              '${enrollDate.month}/${enrollDate.day}/${enrollDate.year}'),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => selectDate(context, 'Enroll Date'),
                          ),
                        ],
                      )
                    : MaterialButton(
                      minWidth: 150.0,
                        child: Text('Select Enroll Date', style: TextStyle(color: Colors.white)),
                        color: Colors.blue,
                        onPressed: () => selectDate(context, 'Enroll Date'),
                      ),
                // TextField(
                //   keyboardType: TextInputType.phone,
                //   decoration: InputDecoration(
                //       labelText: 'Enroll Date',
                //       icon: Icon(Icons.calendar_today)),
                //   onTap: () {
                //     selectDate(context);
                //   },
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
                RaisedButton(
                  child: Text('Save'),
                  onPressed: () {
                    final patient = Patient(
                      sex: sex,
                      weight: weight,
                      enrollDate: enrollDate,
                      // email: email,
                      // manager: manager,
                      // notes: notes,
                    );
                    _submit(patient);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit(Patient patient) async {
    try {
      final database =
          Provider.of<FirestoreDatabaseService>(context, listen: false);
      await database.setPatient(patient: patient).whenComplete(() {
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
