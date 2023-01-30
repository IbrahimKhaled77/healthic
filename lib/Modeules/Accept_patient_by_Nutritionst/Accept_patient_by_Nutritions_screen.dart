import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Management_profilr/Informa_profile/Informa_profile.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

class Accept_Patient extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor),)),
        title: Text("Accept Patient ",style: TextStyle(color: defultColor,fontStyle: FontStyle.italic),),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buliderItems(context),
            separatorBuilder: (context,index)=>Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount: 10,
          )
      ),
    );
  }
}


Widget buliderItems(context)=>InkWell(
  onTap: (){
   // Navigator.push(context,MaterialPageRoute(builder: (context)=>Informat_profile()) );
  },
  child:   Column(

    children: [

      Row(

        children: [

          Expanded(

            child: Row(

              children: [
                CircleAvatar(

                  radius: 42.0,

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
                Expanded(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("Ibrahim majed omar  ",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,),maxLines: 2,),
                      SizedBox(height: 7.0,),
                      Text("juun20/22/9 ",style: TextStyle(fontSize: 17.0,color: Colors.grey[400]),),



                    ],

                  ),
                ),


              ],

            ),

          ),
          Row(
            children: [
              /*
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){},

                icon: Icon(Icons.check_circle_outline,color: Colors.green,),

              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){},

                icon: Icon(Icons.block_outlined,color: Colors.red,),

              ),
               */
              MaterialButton(
                  onPressed:(){},
                 minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  child: Text(
                    "accept",
                    style:TextStyle(
                      color: defultColor,
                    ),

                  ),


              ),
              MaterialButton(
                onPressed:(){},
                padding: EdgeInsets.zero,
                minWidth: 1.0,
                child: Text(
                  "delete",
                  style:TextStyle(
                    color: defultColor,
                  ),

                ),


              ),
            ],
          ),



        ],

      ),



    ],

  ),
);