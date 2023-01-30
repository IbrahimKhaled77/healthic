import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Book_appointment/booked_appointment_clinic_screen.dart';
import 'package:hea_apps/Modeules/Book_appointment/booked_appointment_online_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';


class Appointments_profile_nutritions extends StatefulWidget {
  const Appointments_profile_nutritions(
      {Key? key, required this.id,required this.image,required this.name,required this.isClinc})
      : super(key: key);

  final String id;
  final String image;
  final String name;
  final String isClinc;
  @override
  State<Appointments_profile_nutritions> createState() => _Appointments_profile_nutritions();
}

class _Appointments_profile_nutritions extends State<Appointments_profile_nutritions> {
  var ControllerPageView=PageController();

  var ControllTextField=TextEditingController();

  var rating=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Container(
            height: max(300,MediaQuery.of(context).size.height * 0.3 ),
            child: PageView(
              controller:ControllerPageView,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: defultColor,
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>booked_appointment_online_screen(id: widget.id, type: 'online', name: widget.name, image: widget.image,)));
                            },
                            child: Text(
                              'Book appointment online',
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                          )

                          ,
                        ),

                      ],
                    ),
                    SizedBox(height: 25.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: defultColor,
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>booked_appointment_clinic_screen()));
                              (widget.isClinc).toString().split('.').last =="isTrue"? Navigator.push(context, MaterialPageRoute(builder: (context)=>booked_appointment_online_screen(id: widget.id, type: 'clinic', name: widget.name, image: widget.image,))):"";

                            },
                            child: Text(
                              (widget.isClinc).toString().split('.').last =="isTrue"? "Book appointment clinic":"cant choose",

                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                          )

                          ,
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Skip()
          Positioned(
              right: 0,
              child:Container(
                //color: defultColor,
                child: MaterialButton(
                  onPressed: (){
                    navgtoo();
                  },
                  child: Text("Skip"),
                  textColor: defultColor,
                ),
              )
          ),




        ],
      ),
    );
  }

  buildThanksNote(){
    return Column(
      children: [
        CircleAvatar(

          radius: 45.0,

          child: ClipOval(

            child: Image(

              image: AssetImage("assert/image/as.jpg",),

              height: 90.0,

              width: 90.0,

              fit: BoxFit.cover,

            ),

          ),

        ),
        SizedBox(height: 10,),
        Text("Please rate the nutritionist",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: defultColor,
          ),


        ),
      ],
    );
  }

  navgtoo(){
    if(Navigator.canPop(context))
      return Navigator.pop(context);
  }
}
