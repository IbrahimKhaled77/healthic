import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Management_profilr/Informa_profile/Informa_profile.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../../services/database.dart';

class Management_profile extends StatefulWidget {
  const Management_profile({Key? key}) : super(key: key);

  @override
  State<Management_profile> createState() => _Management_profileState();
}

class _Management_profileState extends State<Management_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) =>
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back, color: defultColor),)),
        titleSpacing: 0.0,
        title: Text("Management profile Nutritionst ",
          style: TextStyle(color: defultColor, fontStyle: FontStyle.italic),),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('user').where(
              'type', isEqualTo: "specialized").where(
              'caneSearch', isEqualTo: "false").snapshots(),

          builder: (context, snapshot) {
            return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Center(child: new CircularProgressIndicator());
                      default:
                        final data = snapshot.data!.docs;
                        return buliderItems(context, data, index);
                    }
                  },
                  separatorBuilder: (context, index) =>
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                      ),
                  itemCount: snapshot.data!.size,
                )
            );
          }
      ),
    );
  }
}


Widget buliderItems(context, data, index) =>
    InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Informat_profile(name: data[index]['name'], email:  data[index]['email'], image:  data[index]['myImage'], phone:  data[index]['phone'], gender:  data[index]['gender'], cvimage:  data[index]['myCv'],)));
      },
      child: Column(

        children: [

          Row(

            children: [

              Expanded(

                child: Row(

                  children: [

                    CircleAvatar(

                      radius: 45.0,

                      child: ClipOval(

                        child: Image(

                          image: NetworkImage(data[index]['myImage']== ""
                              ? 'https://image.freepik.com/free-photo/skeptical-woman-has-unsure-questioned-expression-points-fingers-sideways_273609-40770.jpg'
                              : data[index]['myImage']),

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

                        Text(data[index]['name'], style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),),


                      ],

                    ),

                  ],

                ),

              ),

              IconButton(

                onPressed: () {
                  DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                      .updatecaneSearch(data[index]['uid'],
                      "true");
                },

                icon: Icon(Icons.check_circle_outline, color: Colors.green,),

              ),

              IconButton(

                onPressed: () {
                  DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                      .updatecaneSearch(data[index]['uid'],
                      "cancel");
                },

                icon: Icon(Icons.block_outlined, color: Colors.red,),

              ),

            ],

          ),


        ],

      ),
    );