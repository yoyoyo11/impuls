import 'package:flutter/material.dart';
import 'package:implulsnew/bt/jens_page.dart';
import 'package:implulsnew/screens/choose_patient_screen.dart';
import 'package:implulsnew/screens/clinics_screen.dart';
import 'package:implulsnew/screens/devices_screen.dart';
import 'package:implulsnew/screens/patients_screen.dart';
import 'package:implulsnew/screens/sign_in_screen.dart';
import 'package:implulsnew/screens/therapists_screen.dart';
import 'package:implulsnew/services/firebase_auth_service.dart';
import 'package:implulsnew/widgets/platform_alert_dialog.dart';
import 'package:provider/provider.dart';

class ImpulsHomeScreen extends StatefulWidget {
  @override
  _ImpulsHomeScreenState createState() => _ImpulsHomeScreenState();
}

class _ImpulsHomeScreenState extends State<ImpulsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            // child: Text("Sign Out"),
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () => _confirmSignOut(context),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.email),
            SizedBox(
              height: 15.0,
            ),
            customMaterialButton(
              label: 'Connect Device',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JensPage()),
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            customMaterialButton(
              label: 'Get Started',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChoosePatientWidget(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                customMaterialButton(
                  label: 'Clinics',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClinicsScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                customMaterialButton(
                  label: 'Therapists',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TherapistsScreen(),
                      ),
                    );
                  },
                ),
                 SizedBox(
                  width: 10.0,
                ),
                customMaterialButton(
                  label: 'Patients',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientsScreen(),
                      ),
                    );
                  },
                ),
                 SizedBox(
                  width: 10.0,
                ),
                customMaterialButton(
                  label: 'Devices',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DevicesScreen(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut) {
      _signOut(context);
    }
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<FirebaseAuthService>(context, listen: false);
      await auth.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  MaterialButton customMaterialButton({String label, VoidCallback onPressed}) {
    return MaterialButton(
      color: Colors.blue,
      minWidth: 150.0,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}
