import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:implulsnew/services/firestore_database_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class User {
  User(
      {@required this.uid,
      this.photoUrl,
      this.displayName,
      this.email,
      this.role});
  final String uid;
  final String photoUrl;
  final String displayName;
  final String email;
  final String role;
}

class UserRole {
  UserRole({this.role});
  final String role;
}

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    } else {
      return User(
        uid: user.uid,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
        email: user.email,
      );
    }
  }

  // // This adds userRole to User object during logins OR new sign ups
  // Future<User> _userFromFirebaseAddRole(
  //     FirebaseUser user, String userRole) async {
  //   print('_userFromFirebaseAddRole user is $user');
  //   if (user == null) {
  //     return null;
  //   } else {
  //     String role;
  //     // If userRole is not being passed in, then need to retrieve from Firestore
  //     if (userRole == null) {
  //       try {
  //         // Get userRole from Firestore
  //         await FirestoreDatabaseService(uid: user.uid).getUserRole().then(
  //           (value) {
  //             // If the value for role is still null from Firestore, that means it's Google sign in
  //             if (value == null) {
  //               print('value retrieved for role from Firebase is null');
  //               print('need to assign a role for this user');
  //             } else {
  //               role = value;
  //             }
  //           },
  //         );
  //         print('role returned is $role');
  //       } catch (e) {
  //         print('Error: User does not exist in database. $e');
  //       }
  //     } else {
  //       role = userRole;
  //     }

  //     //TODO: YO - Need to find best way to load user info from Firestore

  //     return User(
  //       uid: user.uid,
  //       displayName: user.displayName,
  //       photoUrl: user.photoUrl,
  //       email: user.email,
  //       role: role,
  //     );
  //   }
  // }

  Stream<User> get onAuthStateChanged {
    print('inside onAuthStatechanged');
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    // return _userFromFirebaseAddRole(user, null);
    return _userFromFirebase(user);
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    print('1. inside signInwithemailandpassword');
    final _authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    String role;

    // // Get userRole from Firestore
    // await FirestoreDatabaseService(uid: _authResult.user.uid)
    //     .getUserRole()
    //     .then((value) {
    //   print('2. value insigninWithEmailandAndPassword = $value');
    //   role = value;
    // });
    // print('3. role from signinwithemailandpassword  = $role');
    // final user = await _userFromFirebaseAddRole(_authResult.user, role);
    final user = await _userFromFirebase(_authResult.user);

    // print('4. signinwithemailandpassword role is ${user.role}');
    return user;
  }

  Future<User> createUserWithEmailAndPassword(
      String email, String password, String userRole) async {
    // First create user in Firebase Auth
    final _authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    // Then create the user in Firestore Database
    // await FirestoreDatabaseService(uid: _authResult.user.uid)
    //     .setNewUser(userRole);
    //return await _userFromFirebaseAddRole(_authResult.user, userRole);
    return await _userFromFirebase(_authResult.user);
  }

  Future<User> signInWithGoogle() async {
    print('inside signinwithgoogle');
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
    print('GoogleSignIn(scopes)');
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    print('await googleSigin.signIn()');
    if (googleSignInAccount != null) {
      print('googleSignInAccount is not null');
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      if (googleSignInAuthentication.idToken != null &&
          googleSignInAuthentication.accessToken != null) {
        AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        AuthResult _authResult =
            await _firebaseAuth.signInWithCredential(credential);

        // Begin retrieval of Role from Firestore

        String role;

        // // Get userRole from Firestore
        // await FirestoreDatabaseService(uid: _authResult.user.uid)
        //     .getUserRole()
        //     .then((value) {
        //   role = value;
        // });
        // print('3. role from googleSignIn  = $role');
        // role = 'Hire';
        // print('4. for now, we will assign Hire for this googleSignIn');
        //final user = await _userFromFirebaseAddRole(_authResult.user, role);
        final user = await _userFromFirebase(_authResult.user);

        // print('4. singinwithemailandpassword role is ${user.role}');
        //return user;
        // End retrieval of Role from Firestore

        return user;
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    // final facebookLogin = FacebookLogin();
    // await facebookLogin.logOut();
    return await _firebaseAuth.signOut();
  }

  Future<void> updateUserData(User user) {}
}
