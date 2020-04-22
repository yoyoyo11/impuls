import 'package:flutter/material.dart';
import 'package:implulsnew/landing_page.dart';
import 'package:implulsnew/screens/sign_in_screen.dart';
import 'package:implulsnew/services/firebase_auth_service.dart';

// /// Builds the signed-in or non signed-in UI, depending on the user snapshot.
// /// This widget should be below the [MaterialApp].
// /// An [AuthWidgetBuilder] ancestor is required for this widget to work.
// class AuthWidget extends StatefulWidget {
//   // Has to be StatefulWidget
//   const AuthWidget({Key key, @required this.userSnapshot}) : super(key: key);
//   final AsyncSnapshot<User> userSnapshot;

//   @override
//   _AuthWidgetState createState() => _AuthWidgetState();
// }

// class _AuthWidgetState extends State<AuthWidget> {
//   String roleRetrieved;
//   bool isLoading = true;
//   User retrievedUser;

//   Future<void> _loadUserInfo(FirebaseAuthService user) async {
//     // It is necessary to get userRole from currentUser because this page is triggered each time
//     // user relaunches the app. Retrieving userRole allows us to redirect the user
//     // to the correct Home Page
//     try {
//     await user.currentUser().then(
//       (userRetrieved) {
//         roleRetrieved = userRetrieved.role;
//         retrievedUser = userRetrieved;
//         print(
//             'roleRetrieved = $roleRetrieved and retrievedUser = ${userRetrieved.email}');
//         if (retrievedUser != null) {
//           print('retrievedUser not null');
//         } else {
//           print('retrievedUser is null');
//         }
//       },
//     );
//     } catch (e) {
//       print(e);
//     }
//     isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('AuthWidget rebuild');
//     final user = Provider.of<FirebaseAuthService>(context);
//     if (isLoading) {
//       _loadUserInfo(user).whenComplete(() {
//         isLoading = false;
//         setState(() {});
//       });
//     }
//     print('authwidget retrieveduser is $retrievedUser');
//     return isLoading
//         ? Scaffold(
//             body: Container(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           )
//         : retrievedUser != null
//             ? roleRetrieved == null
//                 ? ChooseType()
//                 : roleRetrieved == 'Hire'
//                     ? EmployerHomePage()
//                     : CandidateHomePage()
//             : SignInPage();
//   }
// }


/// Builds the signed-in or non signed-in UI, depending on the user snapshot.
/// This widget should be below the [MaterialApp].
/// An [AuthWidgetBuilder] ancestor is required for this widget to work.
/// Note: this class used to be called [LandingPage].
class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? LandingPage() : SignInScreen();
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
