import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:intl/intl.dart';

import '../../services/database.dart';

class ManagementPost extends StatefulWidget {
  @override
  State<ManagementPost> createState() => _ManagementPostState();
}

class _ManagementPostState extends State<ManagementPost> {
  String? imageee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: defultColor),
                )),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Text(
          "ManagementPost",
          style: TextStyle(color: defultColor, fontStyle: FontStyle.italic),
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('post')
              .where('accept', isEqualTo: 'false')
              .snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              default:
                final data = snapshot.data!.docs;
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buliderItems(data, context, index),
                        itemCount: snapshot.data!.size,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 10.0,
                        ),
                      ),
                    ],
                  ),
                );
            }
          }),
    );
  }
}

Widget buliderItems(data, context, index) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 8.0,
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(

                  backgroundImage: NetworkImage(
                      data[index]['userimage'] ==""?
                      "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740&t=st=1666537051~exp=1666537651~hmac=e6535f48409fec3e96d8f2ed0985f5ea33611d5b1d2151dab1f92faf06435526":data[index]['userimage']),
                  radius: 35.0,
                ),
                SizedBox(
                  width: 6.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          data[index]['username'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              height: 1.0),
                        ),


                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      parseTimeStamp(data[index]['date']),
                      style: TextStyle(color: Colors.grey, fontSize: 13.0),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: double.infinity,
                color: Colors.grey[300],
                height: 1.0,
              ),
            ),
            Text(
             data[index]['decs'],
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(height: 1.2),
            ),
            //if(image != null)
            SizedBox(height: 10.0,),
            Container(
              width: double.infinity,
              height: 180.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: DecorationImage(
                  image: NetworkImage(
                    data[index]['postimage'],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: double.infinity,
                color: Colors.grey[300],
                height: 1.0,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green,
                    ),

                    child: MaterialButton(
                      splashColor: defultColor,
                      onPressed: () {
                        DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                            .updatePostStatus(data[index]['id'],
                            "true");

                      },
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            fontStyle: FontStyle.normal, color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                // Spacer(),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:Colors.redAccent,
                    ),
                    child: MaterialButton(
                      splashColor: defultColor,

                      onPressed: () {
                        DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                            .updatePostStatus(data[index]['id'],
                            "cancel");
                      },
                      child: Text(
                        "Reject",
                        style: TextStyle(
                            fontStyle: FontStyle.normal, color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
String parseTimeStamp(String value) {
  var c = int.parse(value);
  var date = DateTime.fromMillisecondsSinceEpoch(c * 1000);
  var d12 = DateFormat('MM-dd hh:mm a').format(date);
  return d12;
}