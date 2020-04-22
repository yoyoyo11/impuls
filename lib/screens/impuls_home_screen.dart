import 'package:flutter/material.dart';
import 'package:implulsnew/screens/sign_in_screen.dart';
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.email),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              child: Text('Connect Device'),
              onPressed: () async {
                // _buildChooseJobBottomSheet(context, 'Instant Offer');
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              child: Text('Get Started'),
              onPressed: () async {
                // _buildChooseJobBottomSheet(context, 'Instant Offer');
              },
            ),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () => _confirmSignOut(context),
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
      final auth = Provider.of<FirebaseAuthService>(context);
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
}
