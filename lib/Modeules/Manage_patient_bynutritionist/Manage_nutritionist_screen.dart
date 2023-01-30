

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/NavBar_pation/NavBar_screen.dart';
import 'package:hea_apps/Modeules/Profile_patient/Profile_patient_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../services/database.dart';
import '../Chat_pation/Chat_pation_detailess/Chat_pation_detailess_screen.dart';

class Manage_Nutritionist_by_patient_screen extends StatefulWidget {
  @override
  State<Manage_Nutritionist_by_patient_screen> createState() => _Manage_Nutritionist_by_patient_screenState();
}

class _Manage_Nutritionist_by_patient_screenState extends State<Manage_Nutritionist_by_patient_screen> {
  var searchFieldController = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer:NavBarPation() ,
        appBar: AppBar(
          leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor),)),
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 0.0,
          title:  Text(
            "Manage patient",
            style: TextStyle(color: defultColor),),

        ),

        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('appointment').where('status', isEqualTo: "accept").where('uidspitizet',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              default:
            final data=snapshot.data!.docs;
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [

                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buliderItems(data,context,index),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                    ),
                    itemCount: snapshot.data!.size,

                  ),

                ],
              ),
            );
          }
            },
      ),
    ));
  }

  Widget buliderItems(data,context,index)=>Column(

    children: [

      Container(
        height: 110.0,

        child: Row(

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

                          image: NetworkImage( data[index]['imagepatint']),

                          height: 90.0,

                          width: 90.0,

                          fit: BoxFit.cover,

                        ),

                      ),

                    ),
                    SizedBox(width: 10.0,),
                    Container(
                      width:250,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsetsDirectional.only(top: 21.0),
                            child: Text(data[index]['namepaint'],
                              style:
                              TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,

                              ),

                            maxLines: 1,
                             // overflow:TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 6.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: data[index]['time'],
                                      style: Theme.of(context).textTheme.subtitle2,
                                    ),

                                  ],

                                ),

                              ),
                              Icon(Icons.star,color: defultColor,size: 16.0,),
                            ],
                          ),

                          SizedBox(height: 10.0,),
                       //  SizedBox(height: 5.0,),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  width: 80.0,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: (){
                                     // Navigator.push(context,MaterialPageRoute(builder:(context)=>ProfilePatient()));
                                      DatabaseService(
                                          uid: FirebaseAuth
                                              .instance.currentUser!.uid).getUserInfo(data[index]['uidpatint']).forEach((element) {
                                        var x=element.docs[0];
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePatient(
                                                      id: data[index]['uidpatint'], spizlezedName:x['name'], spizlezedImage: x['myImage'],
                                                      spizlezedAge: x['age'], spizlezedGender: x['gender'], spizlezedCv: x['myCv'], spizlezedPhone: x['phone'], spizlezedWidght: x['weight'], spizlezedHeight: x['height'], diseases: x['diseases'],


                                                    )));
                                      });
                                    },
                                    icon: Text("view profile",
                                    style: TextStyle(
                                       color: defultColor,
                                    ),

                                    ),
                                  ),
                                ),

                                Container(
                                  width: 40.0,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () async {
                                      print(data[index]['uidpatint']);
                                      var chatColectionId=await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).chatColectId(data[index]['uidpatint']);
                                      var chatColectSubscrib=await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).chatColectSubscrib(data[index]['uidpatint']);

                                      Navigator.push(context,MaterialPageRoute(builder:(context)=>Chatdetailes( chatColectionId: chatColectionId, typeSubscribtion: chatColectSubscrib, name: data[index]['namepaint'], image:data[index]['imagepatint'],)) );

                                    },
                                    icon: Text("chat",
                                      style: TextStyle(
                                        color: defultColor,
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

                  ],

                ),
              ),

            ),



          ],

        ),
      ),



    ],

  );
}
