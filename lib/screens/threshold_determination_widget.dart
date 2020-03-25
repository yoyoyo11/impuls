/*
*  threshold_determination_widget.dart
*  KleinKlein Wireframes
*
*  Created by marc.
*  Copyright © 2018 Uni-Marburg. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:implulsnew/styles/button.dart';
import 'package:implulsnew/styles/h2.dart';
import 'package:implulsnew/styles/h4.dart';
import 'package:implulsnew/screens/threshold_summary_widget.dart';
import 'package:implulsnew/values/values.dart';

class ThresholdDeterminationWidget extends StatefulWidget {
  @override
  _ThresholdDeterminationWidgetState createState() =>
      _ThresholdDeterminationWidgetState();
}

class _ThresholdDeterminationWidgetState
    extends State<ThresholdDeterminationWidget> {
  void onStimButtonPressed(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => ThresholdSummaryWidget()));
  void onRatingSTPressed(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => ThresholdSummaryWidget()));
  void onRatingPOPressed(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => ThresholdSummaryWidget()));
  void onRatingTTPressed(BuildContext context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => ThresholdSummaryWidget()));

  final int stimAmplitude = 100;
  final int currentIBI = 60;

//  BoxDecoration borderDecoration() {
//    return BoxDecoration(
//      border: Border.all(
//        width: 1, //                   <--- border width here
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    List<int> text = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          H2(
            child: Text(
              "Threshold Determination",
              textAlign: TextAlign.left,
              style: TextStyle(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              H4(
                child: Text(
                  "Stim Level: $stimAmplitude mA       ",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
              ButtonButton(
                padding: EdgeInsets.all(0),
                onPressed: () => this.onStimButtonPressed(context),
                child: Text(
                  "STIMULATE",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
              H4(
                child: Text(
                  "          IBI: $currentIBI b/m",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
            ],
          ),
          H4(
            child: Text(
              "Pain Rating",
              textAlign: TextAlign.left,
              style: TextStyle(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1, //                   <--- border width here
                  ),
                ),
                child: Text(
                  "N/A",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ),
                ),
              ),
              for (var i in text)
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "$i",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 23,
                    ),
                  ),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonButton(
                padding: EdgeInsets.all(0),
                onPressed: () => this.onRatingSTPressed(context),
                child: Text(
                  "SENSITIVTY RATING",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonButton(
                  color: AppColors.primaryElement,
                  padding: EdgeInsets.all(0),
                  onPressed: () => this.onRatingPOPressed(context),
                  child: Text(
                    "PAIN ONSET RATING",
                    textAlign: TextAlign.left,
                    style: TextStyle(),
                  ),
                ),
              ),
              ButtonButton(
                padding: EdgeInsets.all(0),
                onPressed: () => this.onRatingSTPressed(context),
                child: Text(
                  "TOLERANCE RATING",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
