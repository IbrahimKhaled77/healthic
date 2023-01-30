
import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

class ChatdetailesNutritionst extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Row(
          children: [
            SizedBox(width: 5.0,),
            CircleAvatar(

              radius: 25.0,

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
            Text(
              "Ibrahim majed ",
              style:
              TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                color: defultColor,
              ),),

          ],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10.0),
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0),
                  ),

                ),
                padding: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                child: Text(
                  "Hello world"
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(

                decoration: BoxDecoration(
                  color: defultColor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10.0),
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0),
                  ),

                ),
                padding: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                child: Text(
                    "Hello world",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
            Container(
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
                      hintText: "tupr your message here...",
                    ),
                  )
                  ),
                  Container(
                 //   height: 50.0,
                    //color: defultColor,
                    child: MaterialButton(
                        onPressed:(){},
                      minWidth: 1.0,
                      child:Text(
                        "Send",
                        style: TextStyle(
                          color: defultColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
