import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

class Track_diet_plan extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor,),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Track diet plan", style: TextStyle(color: defultColor),),
        actions: [


        ]
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10.0),
        children: [
          SizedBox(
            height: 15.0,
          ),
          Padding(padding: EdgeInsets.only(left: 15.0),
            child: Row(
              children: [
                //Text('',style: TextStyle(color: Colors.teal,fontSize: 25.0,),), // Write here any thing
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height-85.0,
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(topRight: Radius.circular(75.0),topLeft: Radius.circular(75.0))
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 24.0,right: 24.0),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                Container(
                  height: MediaQuery.of(context).size.height-300,
                  child: ListView(
                    children: [
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                      _buildFoodItem('FoodName','Calorie'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.white,style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: Text(
                          'Breakfast',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.teal,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.white,style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: Text(
                          'Lunch',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.teal,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.white,style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: Text(
                          'Dinner',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.teal,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}


Widget _buildFoodItem (String FoodName, String Calorie){
  return Padding(padding: EdgeInsets.only(left: 14.0,top: 10.0),
    child: InkWell( child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [

              // IconButton(icon: Icon(Icons.check_circle_outline ,color: Colors.white),
              //   onPressed: (){
              //     setState();
              //   },
              //
              // ),
              // Text('milk', style: TextStyle(fontSize: 20.0,color: Colors.white,
              //   fontStyle: FontStyle.italic,) ,),
              SizedBox(
                height: 15.0,
                width: 7.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FoodName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],

          ),
        ),
        Text(
          Calorie,
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),

    ),
  );
}
