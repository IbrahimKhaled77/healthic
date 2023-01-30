

import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/NavBar_pation/NavBar_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class Manage_patient_by_Nutritionist_screen extends StatelessWidget {
  var searchFieldController = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer:NavBarPation() ,
        appBar: AppBar(
          leading: Builder(builder: (context)=>IconButton(onPressed: (){Scaffold.of(context).openDrawer();},icon: Icon(Icons.menu,color: defultColor),)),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title:  Text(
            "Manage nutritionist",
            style: TextStyle(color: defultColor),),

        ),

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buliderItems(context),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
                itemCount: 10,

              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buliderItems(context)=>Column(

    children: [

      Row(

        children: [
          Expanded(

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(

                children: [

                  CircleAvatar(

                    radius: 40.0,

                    child: ClipOval(

                      child: Image(

                        image: AssetImage("assert/image/as.jpg",),

                        height: 90.0,

                        width: 90.0,

                        fit: BoxFit.cover,

                      ),

                    ),

                  ),
                  SizedBox(width: 10.0,),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("Ibrahim majed ",
                        style:
                        TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 5.0,),
                      SmoothStarRating(
                        starCount: 5,
                        rating: 3.5,
                        size: 24.0,
                        color: Colors.teal,
                        borderColor: Colors.teal,

                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Near you",//or far from you (orr)هون حيكون موقع طبيب
                        style: TextStyle(
                          color: Colors.teal.withOpacity(0.5),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,

                        ),

                      ),

                      /* Text(
                        "juun20/22/9 ",
                        style:
                        TextStyle(fontSize: 17.0,
                            color: Colors.grey[300]
                        ),),*/



                    ],

                  ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.teal.withOpacity(0.5),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    icon: Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red.withOpacity(0.5), //بصير لونو اذ كبس عليها وضاف دكتور teal
                    ),
                  ),

                ],

              ),
            ),

          ),



        ],

      ),



    ],

  );
}
