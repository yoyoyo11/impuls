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
  TextStyle textFieldStyle =
      TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String email;
  String password;
  bool showLoading = false;
  //SharedPreferencesHelper prefHelper = SharedPreferencesHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                Image(
                    image: AssetImage(
                  "assets/images/screen-shot-2020-03-14-at-102826-pm.png",
                )),
                SizedBox(
                  height: 100.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  style: textFieldStyle,
                  onChanged: (newEmail) {
                    email = newEmail.trim();
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: textFieldStyle,
                  onChanged: (newPassword) {
                    password = newPassword;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15.0),
                showLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                        child: Text(
                          'Sign In',
                          style: textFieldStyle.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blue,
                        onPressed: () async {
                          try {
                            setState(() {
                              showLoading = true;
                            });
                            final auth = Provider.of<FirebaseAuthService>(
                                context,
                                listen: false);
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
