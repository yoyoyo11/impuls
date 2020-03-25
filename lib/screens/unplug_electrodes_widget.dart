/*
*  mount_electrodes_widget.dart
*  KleinKlein Wireframes
*
*  Created by marc.
*  Copyright © 2018 Uni-Marburg. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:implulsnew/screens/session_review_widget.dart';
import 'package:implulsnew/styles/button.dart';
import 'package:implulsnew/styles/h2.dart';
import 'package:implulsnew/styles/h3.dart';

class UnplugElectrodesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UnplugElectrodesWidgetState();
}

class _UnplugElectrodesWidgetState extends State<UnplugElectrodesWidget> {
  bool electrodesAttach = false;
  bool machineOn = false;

  /// box widget
  /// [title] is the name of the checkbox
  /// [boolValue] is the boolean value of the checkbox
  Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "Att":
                  electrodesAttach = value;
                  break;
                case "On":
                  machineOn = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  void onButtonsContainedPressed(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SessionReviewWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Spacer(),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                H2(
                  child: Text(
                    "Unplug electrodes",
                    textAlign: TextAlign.left,
                    style: TextStyle(),
                  ),
                ),
                Row(
                  children: [
                    checkbox("Att", electrodesAttach),
                    H3(
                      child: Text(
                        "   Disconnect Electrodes",
                        textAlign: TextAlign.left,
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    checkbox("On", machineOn),
                    H3(
                      child: Text(
                        "   Turn off Impuls",
                        textAlign: TextAlign.left,
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ButtonButton(
                    padding: EdgeInsets.all(0),
                    onPressed: ()  {if (machineOn == true) this.onButtonsContainedPressed(context);},
                    child: Text(
                      "SESSION REVIEW",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
