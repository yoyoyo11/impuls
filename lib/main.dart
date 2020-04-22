import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:implulsnew/auth_widget.dart';
import 'package:implulsnew/auth_widget_builder.dart';
import 'package:implulsnew/screens/sign_in_screen.dart';
// import 'package:implulsnew/named_routes.dart';
import 'package:implulsnew/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]); // Hides Android Status Bar
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  // Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
      ],
      child: AuthWidgetBuilder(
        builder: (context, userSnapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Color(0xFF3EBACE), accentColor: Color(0xFFD8ECF1)),
            home: AuthWidget(userSnapshot: userSnapshot),
            routes: {
              SignInScreen.id: (context) => SignInScreen(),
              
            },
          );
        },
      ),
    );
  }
}
