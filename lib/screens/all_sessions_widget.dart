import 'package:flutter/material.dart';
import 'package:implulsnew/screens/session_review_widget.dart';
import 'package:implulsnew/styles/button.dart';
import 'package:implulsnew/styles/h3.dart';
import 'package:implulsnew/styles/h5.dart';
import 'package:implulsnew/screens/final_pain_level_widget.dart';

class AllSessionsPreSessionWidget extends SessionReviewWidget {
  void onChipsChoiceOutPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SessionReviewWidget()));

  void onEndSessionPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => FinalPainLevelWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                H3(
                  child: Text(
                    "Results Review",
                    textAlign: TextAlign.left,
                    style: TextStyle(),
                  ),
                ),
                buildSessionControl(context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                H5(
                  child: Text(
                    "Thresholds by Session",
                    textAlign: TextAlign.left,
                    style: TextStyle(),
                  ),
                ),
                H5(
                  child: Text(
                    "Thresholds by Session",
                    textAlign: TextAlign.left,
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Session",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/path-2020.png",
                          ),
                          Text(
                            " Sensory Threshold",
                            textAlign: TextAlign.left,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/path-2022.png",
                          ),
                          Text(
                            " Pain Tolerance",
                            textAlign: TextAlign.left,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/path-2021.png",
                          ),
                          Text(
                            " Pain Threshold",
                            textAlign: TextAlign.left,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/path-2020.png",
                          ),
                          Text(
                            " Sensory Threshold",
                            textAlign: TextAlign.left,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/path-2022.png",
                          ),
                          Text(
                            " Pain Tolerance",
                            textAlign: TextAlign.left,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/path-2021.png",
                          ),
                          Text(
                            " Pain Threshold",
                            textAlign: TextAlign.left,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Stimulation Level (mA)",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () =>
                      this.onEndSessionPressed(context),
                  child: Text(
                    "SESSION END",
                    textAlign: TextAlign.left,
                    style: TextStyle(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
