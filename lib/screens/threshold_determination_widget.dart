//TODO The process here is:
// Thresshold determination
// Thresshold determination
// Average
// STIM 1
// Thresshold determination
// Thresshold determination
// Average
// STIM 2 (change the stim screen number from 1.2 to 1.2 to 2.1 to 2.2 and the Stim Finished button to indigo and back to this screen anfter 1.2 and 2 unplug after 2.2
// Thresshold determination
// The determinations(each time 3 mA values need to be stored in to Mysql and sent to the device for stimulation
// When N/A is pressed it should change color to Color(0xffD97676), the sensitvity button to color: AppColors.primaryElement, the PAIN ONSET to Indigo and the mA value saved
// When 0 is pressed it should change color to light green, the Pain Onset button to color: to indigo, and the mA value saved
// When 1 is pressed it should change color to light red, the Tolerance Rating button to idiogo and the pain onset button to AppColors.primaryElement,and the mA value saved
// When 10 is pressed it should change capture the value and leave the screed ti the next threshold screen or the threshold summary
// As interim numbers are pressed the colors should go to light red and mA captured with the number.
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
                color: AppColors.primaryElement,
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
