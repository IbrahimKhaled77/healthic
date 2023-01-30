import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';


class Rating_Nurtions extends StatefulWidget {
  @override
  State<Rating_Nurtions> createState() => _Rating_NurtionsState();
}

class _Rating_NurtionsState extends State<Rating_Nurtions> {
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
                buildThanksNote(),
              ],
            ),
          ),
          //Done()
          Positioned(
            bottom: 0,
              right: 0,
              left: 0,
              child:Container(
                color: defultColor,
                child: MaterialButton(
                  onPressed: (){
                    navgtoo();
                  },
                  child: Text("Done"),
                  textColor: Colors.white,
                ),
              )
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
          //star rating:
          AnimatedPositioned(
            top: 125.0,
            left: 0,
            right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) =>IconButton(
                    icon: index<rating ? Icon(Icons.star,size: 32,):Icon(Icons.star_border,size: 32,),
                    color: defultColor,
                  onPressed: (){
                      setState(() {
                        rating= index+1;
                      });

                  },
                  enableFeedback: true,
                ) ),
              ),
              duration: Duration(milliseconds: 300),
          ),
          Positioned(
            left: 0,
              right: 0,
              top: 180,
              child:Container(
                //color: defultColor,
                child: TextField(
                  controller:ControllTextField ,
                  decoration: InputDecoration(
                    hintText: "Write your opinion on nutritionist...",
                    hintStyle: TextStyle(
                      //color: defultColor.withOpacity(0.6),
                      color: Colors.grey[400],

                    ),
                    enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                           color: Color(0x00000000),
                            width: 1
                         ),
                  )),
                  textAlign: TextAlign.center,

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
