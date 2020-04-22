import 'package:flutter/material.dart';
import 'package:implulsnew/screens/impuls_home_screen.dart';
// import 'package:implulsnew/screens/sign_in/choose_type.dart';
import 'package:implulsnew/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  static const id = 'landing';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String roleRetrieved;
  bool isLoading = true;
  //UserInfo userInfo;

  Future<void> _loadUserInfo(BuildContext context) async {
    // It is necessary to get userRole from currentUser because this page is triggered each time
    // user relaunches the app. Retrieving userRole allows us to redirect the user
    // to the correct Home Page

    final user = Provider.of<FirebaseAuthService>(context);
    
    await user.currentUser().then(
      (userRetrieved) {
        roleRetrieved = userRetrieved.role;
      },
    );
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    //final database = Provider.of<FirestoreDatabaseService>(context);
    if (isLoading) {
       _loadUserInfo(context).whenComplete(() {
         isLoading = false;
        setState(() {});
      });
    }
    return isLoading
        ? Scaffold(
            body: Container(child: Center(child: CircularProgressIndicator())))
        : ImpulsHomeScreen();
        // : roleRetrieved == null
        //     ? ChooseType()
        //     : roleRetrieved == 'Hire'
        //         ? EmployerHomePage()
        //         : CandidateHomePage();
  }
}
