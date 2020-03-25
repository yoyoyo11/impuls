/*
*  threshold_summary_widget.dart
*  KleinKlein Wireframes
*
*  Created by marc.
*  Copyright © 2018 Uni-Marburg. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:implulsnew/screens/stimulation_widget.dart';
import 'package:implulsnew/styles/button.dart';
import 'package:implulsnew/styles/h2.dart';
import 'package:implulsnew/styles/h4.dart';

class ThresholdSummaryWidget extends StatelessWidget {
  void onButtonsContainedPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => StimulationWidget()));

  final int sensitivty = 400;
  final int painOnset = 1200;
  final int tolerance = 2400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.center,
            child: H2(
              child: Text(
                "Threshold Summary",
                textAlign: TextAlign.left,
                style: TextStyle(),
              ),
            ),
          ),
          Align(
              alignment: Alignment(-0.5, 0.0),
            child: H4(
              child: Text(
                "Sensory Threshold is $sensitivty mA",
                textAlign: TextAlign.left,
                style: TextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, 0.0),
            child: H4(
              child: Text(
                "Pain Onset is $painOnset mA          ",
                textAlign: TextAlign.left,
                style: TextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, 0.0),
            child: H4(
              child: Text(
                "Pain Tolerance is $tolerance mA  ",
                textAlign: TextAlign.left,
                style: TextStyle(),
              ),
            ),
          ),
          Center(
            child: ButtonButton(
              onPressed: () => this.onButtonsContainedPressed(context),
              child: Text(
                "BEGIN STIMULATION",
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
