import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Manage%20Diet%20plan/Manage_Diet_plan_Screen.dart';
import 'package:hea_apps/Modeules/Management_profilr/Informa_profile/Informa_profile.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../View diet plan/View_diet_plan_screen.dart';

class My_DatePlan_listScreen extends StatefulWidget {
  @override
  State<My_DatePlan_listScreen> createState() =>
      _My_DatePlan_listScreenState();
}

class _My_DatePlan_listScreenState extends State<My_DatePlan_listScreen> {
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
        title: Text(
          "My Diet plan ",
          style: TextStyle(color: defultColor, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chat')
              .where('userLoginId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where('subscribtion', isEqualTo: 'Subscription')
              .snapshots(),
          builder: (context, snapshot) {
    switch (snapshot.connectionState) {
    case ConnectionState.waiting:
    return new Center(child: new CircularProgressIndicator());
    default:return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs;
                    return buliderItems(context, data, index);
                  },
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],
                    ),
                  ),
                  itemCount: snapshot.data!.size,
                ));
          }},
    ));
  }
}

Widget buliderItems(context,data,index) => InkWell(
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Informat_profile()));
      },
      child: Column(
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
                          image: NetworkImage(data[index]['imageOwnerItem'] == null
                              ? ""
                              : data[index]['imageOwnerItem']),
                          height: 90.0,
                          width: 90.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['nameOwnerItemUser'],
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          /*Text(
                            "juun20/22/9 ",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.grey[400]),
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => View_diet_plan(id: data[index]['userOwnerItemId'],)));
                    },
                    minWidth: 1.0,
                    padding: EdgeInsets.zero,
                    child: Text(
                      "My  plan",
                      style: TextStyle(
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
