import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:implulsnew/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'sign_in_page';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email;
  String password;
  bool showLoading = false;
  //SharedPreferencesHelper prefHelper = SharedPreferencesHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impuls'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (newEmail) {
                    email = newEmail;
                  },
                  // decoration: kTextFieldDecoration.copyWith(
                  //     hintText: 'Enter Email'),
                  decoration: InputDecoration(hintText: 'Enter Email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (newPassword) {
                    password = newPassword;
                  },
                  // decoration: kTextFieldDecoration.copyWith(
                  //     hintText: 'Enter Password'),
                  decoration: InputDecoration(hintText: 'Enter Password'),
                ),
                SizedBox(height: 8.0),
                showLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text('Sign In'),
                        color: Colors.blue,
                        onPressed: () async {
                          try {
                            setState(() {
                              showLoading = true;
                            });
                            final auth =
                                Provider.of<FirebaseAuthService>(context, listen: false);
                            await auth
                                .signInWithEmailAndPassword(email, password)
                                .whenComplete(() {});
                          } on PlatformException catch (e) {
                            print(e);
                            // PlatformExceptionAlertDialog(
                            //   title: Strings.signInFailed,
                            //   exception: e,
                            // ).show(context);
                            setState(() {
                              showLoading = false;
                            });
                          }
                        },
                      ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
