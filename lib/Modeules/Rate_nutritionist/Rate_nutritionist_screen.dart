
import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class Rate_Nutritionist extends StatelessWidget {

  var yourAilmentsController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){},icon: Icon(Icons.arrow_back,color: defultColor),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:  Text(
          "Rate nutritionist",
          style: TextStyle(color: defultColor),),

      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: 5.0,),
                Text("Ibrahim majed ",
                  style:
                  TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: 20.0,),
                SmoothStarRating(
                  starCount: 5,
                  rating: 2.5,
                  size: 30.0,
                  color: Colors.teal,
                  borderColor: Colors.teal,

                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: yourAilmentsController ,
                    decoration: InputDecoration(
                      labelText: 'optional',
                      labelStyle: Theme.of(context).textTheme.bodyText2,
                      hintText: 'Write your opinion on nutritionist..',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: Theme.of(context).textTheme.bodyText1,

                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  decoration: BoxDecoration(
                    color: defultColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: MaterialButton(
                    onPressed:(){},
                    child: Text(
                        "Submit",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* Container(
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children: [
                  Expanded(
                      child:TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write your opinion on nutritionist...",
                        ),
                      )
                  ),
                 /* Container(
                    height: 50.0,
                    color: defultColor,
                    child: MaterialButton(
                      onPressed:(){},
                      minWidth: 1.0,
                      child: Icon(
                        IconlyBroken.send,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),*/
                ],
              ),
            ),*/
