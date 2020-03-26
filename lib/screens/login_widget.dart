//TODO Connected to mysql server to authenticate
/*
*  login_widget.dart
*  KleinKlein Wireframes
*
*  Created by marc.
*  Copyright © 2018 Uni-Marburg. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:implulsnew/screens/choose_patient_widget.dart';
import 'package:implulsnew/styles/button.dart';
import 'package:implulsnew/styles/h3.dart';

class LoginWidget extends StatelessWidget {
  void onColorLContainePressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ChoosePatientWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          H3(
            child: TextField(
              decoration: InputDecoration(
                hintText: "your name",
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
              ),
              style: H3TextStyle(),
              textAlign: TextAlign.center,
              maxLines: 1,
              autocorrect: false,
            ),
          ),
          H3(
            child: TextField(
              decoration: InputDecoration(
                hintText: "password",
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
              ),
              style: H3TextStyle(),
              textAlign: TextAlign.center,
              obscureText: true,
              maxLines: 1,
              autocorrect: false,
            ),
          ),
          Spacer(),
          ButtonButton(
            padding: EdgeInsets.all(0),
            onPressed: () => this.onColorLContainePressed(context),
            child: Text(
              "SUBMIT",
              textAlign: TextAlign.left,
              style: TextStyle(),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
