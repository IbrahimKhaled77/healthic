//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class multiSwitch extends StatefulWidget {
  //const multiSwitch({Key? key}) : super(key: key);

  @override
  State<multiSwitch> createState() => _multiSwitchState();
}

class _multiSwitchState extends State<multiSwitch> {
  bool val1 =true;
  bool val2 =true;
  bool val3 =true;
  bool val4 =true;
  bool val5 =true;
  bool val6 =true;


  onChangeFunction1(bool newValue1){
    setState(() {
      val1 =newValue1;
    });
  }
  onChangeFunction2(bool newValue2){
    setState(() {
      val2 =newValue2;
    });
  }
  onChangeFunction3(bool newValue3){
    setState(() {
      val3 =newValue3;
    });
  }
  onChangeFunction4(bool newValue4){
    setState(() {
      val4 =newValue4;
    });
  }
  onChangeFunction5(bool newValue5){
    setState(() {
      val5 =newValue5;
    });
  }
  onChangeFunction6(bool newValue6){
    setState(() {
      val6 =newValue6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            children: [
              Icon(Icons.arrow_back,
                color: Colors.teal,),
              SizedBox(
                width:100.0,
              ),
              Text('Dont Disturb!',
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSwitch('For 15 minutes',val1,onChangeFunction1),
            customSwitch('For 1 hour',val2,onChangeFunction2),
            customSwitch('For 8 hours',val3,onChangeFunction3),
            customSwitch('For 24 hours',val4,onChangeFunction4),
            customSwitch('Until I Change it',val5,onChangeFunction5),
            customSwitch('Cancel',val6,onChangeFunction6),


          ],



        ),
      ),
    );
  }
  Widget customSwitch(String text , bool Val , Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 40.0,),
      // padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),),
          Spacer(),
          CupertinoSwitch(
              trackColor: Colors.grey,
              activeColor: Colors.teal,
              value: Val,
              onChanged: (newValue) {
                onChangeMethod(newValue);
              }
          ),
        ],
      ),

    );






  }


}