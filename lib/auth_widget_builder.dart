import 'package:flutter/material.dart';
import 'package:implulsnew/services/firebase_auth_service.dart';
// import 'package:implulsnew/services/firebase_storage_service.dart';
import 'package:implulsnew/services/firestore_database_service.dart';
// import 'package:implulsnew/utilities/constants.dart';
import 'package:provider/provider.dart';
//import 'package:implulsnew/models/user.dart' as u;
//import 'package:implulsnew/models/user_info.dart';

/// Used to create user-dependent objects that need to be accessible by all widgets.
/// This widget should live above the [MaterialApp].
/// See [AuthWidget], a descendant widget that consumes the snapshot generated by this builder.
class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({Key key, @required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<User>) builder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<FirebaseAuthService>(context);
    return StreamBuilder<User>(
      stream: authService.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        // User is signed in and retrieved here
        final User user = snapshot.data;
        if (user != null) {
          return MultiProvider(
            providers: [
              Provider<User>.value(value: user),
              Provider<FirestoreDatabaseService>(
                create: (_) => FirestoreDatabaseService(uid: user.uid),
              ),
              // Provider<FirebaseStorageService>(
              //   create: (_) => FirebaseStorageService(uid: user.uid),
              // ),
            ],
            child: builder(context, snapshot),
          );
        }
        return builder(context, snapshot);
      },
    );
  }
}
