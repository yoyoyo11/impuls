/*
*  logo_widget.dart
*  KleinKlein Wireframes
*
*  Created by marc.
*  Copyright © 2018 Uni-Marburg. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:implulsnew/screens/login_widget.dart';
import 'package:implulsnew/styles/klein_dark.dart';

class LogoButtonWidget extends StatelessWidget {
  void onScreenShot202003Pressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginWidget()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: InkWell(
                  onTap: () => this.onScreenShot202003Pressed(context),
                  child: Image.asset(
                    "assets/images/screen-shot-2020-03-14-at-102826-pm.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
