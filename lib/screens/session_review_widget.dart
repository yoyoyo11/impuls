/*
*  session_review_widget.dart
*  KleinKlein Wireframes
*
*  Created by marc.
*  Copyright © 2018 Uni-Marburg. All rights reserved.
    */
//TODO Make graphs and display data

import 'package:flutter/material.dart';
import 'package:implulsnew/screens/all_sessions_widget.dart';
import 'package:implulsnew/screens/session_detail_widget.dart';
import 'package:implulsnew/styles/button.dart';
import 'package:implulsnew/styles/h4.dart';

class SessionReviewWidget extends StatelessWidget {
  void onIconNavigationArrowDropUp24pxPressed(BuildContext context) {}

  void onIconNavigationArrowDropDown24pxPressed(BuildContext context) {}

  void goToSession(BuildContext context) {}

  void onButton3BackContainedATextLightCopyPressed(BuildContext context) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllSessionsPreSessionWidget()));

  void onThresholdGraphLongPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SessionDetailWidget()));

  final int sessionNumber = 4;

  //TODO the arrows need to change the session number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: <Widget>[
              H4(
                child: Text(
                  "SESSION  OUTCOME",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(),
                  buildSessionControl(context),
                  Spacer(),
                  ButtonButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () =>
                        this.onButton3BackContainedATextLightCopyPressed(context),
                    child: Text(
                      "ALL SESSIONS",
                      textAlign: TextAlign.left,
                      style: TextStyle(),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Thresholds",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(222, 0, 0, 0),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      letterSpacing: -0.5625,
                    ),
                  ),
                  Flexible(
                    child: FractionallySizedBox(widthFactor: 0.2),
                  ),
                  Text(
                    "Pain Levels",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(222, 0, 0, 0),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      letterSpacing: -0.5625,
                    ),
                  ),
                  Flexible(
                    child: FractionallySizedBox(widthFactor: 0.2),
                  ),
                  Text(
                    "Progress",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(222, 0, 0, 0),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      letterSpacing: -0.5625,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onDoubleTap: () => this.onThresholdGraphLongPressed(context),
                    child: GraphBox(),
                  ),
                  graphBox(),
                  Container(
                    height: 250,
                    width: 150,
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          color: Colors.yellowAccent,
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/images/-color-dark.png",
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/images/icon-action-favorite.png",
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container graphBox() {
    return Container(
                  height: 450,
                  width: 350,
                  margin: EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 216, 216, 216),
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Container(),
                );
  }

  Row buildSessionControl(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () => this.onIconNavigationArrowDropUp24pxPressed(context),
          color: Color.fromARGB(0, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          textColor: Color.fromARGB(255, 0, 0, 0),
          padding: EdgeInsets.all(0),
          child: Image.asset(
            "assets/images/icon-navigation-arrow-drop-up-24px.png",
          ),
        ),
        ButtonButton(
          padding: EdgeInsets.all(0),
          onPressed: () => this.goToSession(context),
          child: Text(
            "SESSION $sessionNumber DETAIL",
            textAlign: TextAlign.left,
            style: TextStyle(),
          ),
        ),
        FlatButton(
          onPressed: () =>
              this.onIconNavigationArrowDropDown24pxPressed(context),
          color: Color.fromARGB(0, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          textColor: Color.fromARGB(255, 0, 0, 0),
          padding: EdgeInsets.all(0),
          child: Image.asset(
            "assets/images/icon-navigation-arrow-drop-down-24px.png",
          ),
        ),
      ],
    );
  }
}

class GraphBox extends StatelessWidget {
  const GraphBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 350,
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 216, 216, 216),
        border: Border.all(
          width: 1,
          color: Color.fromARGB(255, 151, 151, 151),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            offset: Offset(2, 2),
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Container(),
    );
  }
}
