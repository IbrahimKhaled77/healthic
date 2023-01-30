
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hea_apps/Modeules/Register_noutris/Register_Specialized_Screen.dart';
import 'package:hea_apps/Modeules/Register_patient/Register_Patien_Screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';

class HomeCreatScreen extends StatefulWidget {


  @override
  State<HomeCreatScreen> createState() => _HomeCreatScreenState();
}

class _HomeCreatScreenState extends State<HomeCreatScreen> {
  var c= true;
  var f= false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 50.0),
                child: Column(
                  children: [
                    SizedBox(height: 10.0,),
                    SvgPicture.asset('assert/image/logogApp.svg',height: 100,width: 100,),
                    SizedBox(height: 5.0,),
                    Text("Healthic",style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Column(
                children: [
                  SizedBox(height: 60.0,),
                  Text("Are you ready to change",
                    style:
                    TextStyle(
                      color: defultColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 25.0,

                    ),),SizedBox(height: 15.0,),
                  Container(
                    width: 300.0,
                    height: 200.0,
                    padding:const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: defultColor as Color ,width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 17.0,),
                        Container(
                          width: 200.0,
                          decoration:BoxDecoration(
                            border: Border.all(width: 1,color:Colors.transparent ),
                            borderRadius: BorderRadius.circular(40),
                            color:defultColor.withOpacity(.6),

                          ),
                          child: MaterialButton(
                              onPressed: (){
                                Diohelper.SaveData(key: 'patient', value: true).then((value) {
                                  if(value){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPatien()),);
                                  }
                                });
                                setState(() {
                                  c=true;
                                  f=false;
                                });
                              },
                          child: Text(
                              "Sign up as patient  ",
                            style: TextStyle(
                              color:  Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Container(
                          width: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: defultColor.withOpacity(.6),
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              Diohelper.SaveData(key: 'Specialized', value: true).then((value) {
                                if(value){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterSpecialized()),
                                  );
                                }
                              });
                              setState(() {
                                c=false;
                                f=true;
                              });
                            },
                            child: Text(
                              "Sign up as Nutritionist",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


