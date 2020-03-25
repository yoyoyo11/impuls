
import 'package:flutter/material.dart';
import 'package:implulsnew/screens/choose_patient_widget.dart';
import 'package:implulsnew/screens/logo_widget.dart';
import 'package:implulsnew/styles/h2.dart';
import 'package:implulsnew/styles/h3.dart';
import 'package:implulsnew/styles/button.dart';

class FinalPainLevelWidget extends StatefulWidget {
  @override
  _FinalPainLevelWidgetState createState() => _FinalPainLevelWidgetState();
}

class _FinalPainLevelWidgetState extends State<FinalPainLevelWidget> {

  void onChoosePatientPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ChoosePatientWidget()));

  void onLogOutPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LogoButtonWidget()));


  static double _rating=1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 200, right: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              H2(
                child: Text(
                  "Final Pain Level",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
              H3(
                child: Text(
                  "Rate from 0-10",
                  textAlign: TextAlign.left,
                  style: TextStyle(),
                ),
              ),
              Spacer(),
              Slider(
                min: 0,
                max: 10,
                divisions: 100,
                activeColor: Colors.indigo,
                inactiveColor: Colors.amber,
                value: _rating,
                onChanged: (newrating) {
                  setState(() => _rating = newrating);
                },
                label: "$_rating",
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ButtonButton(
                    onPressed: () =>
                        this.onChoosePatientPressed(context),
                    child: Text(
                      "SUBMIT",
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ),
                  ButtonButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () =>
                        this.onLogOutPressed(context),
                    child: Text(
                      "LOG OUT",
                      textAlign: TextAlign.left,
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
