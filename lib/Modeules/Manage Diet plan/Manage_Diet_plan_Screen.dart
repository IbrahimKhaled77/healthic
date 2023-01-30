import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../Creat_dite_plan/Creat_data_plan_screen.dart';

class Manage_diet_plans extends StatefulWidget {
  const Manage_diet_plans({
    Key? key,
    required this.id,
  }) : super(key: key);

  // Step 2 <-- SEE HERE
  final String id;

  @override
  State<Manage_diet_plans> createState() => _Manage_diet_plansState();
}

class _Manage_diet_plansState extends State<Manage_diet_plans> {
  // var DataCell = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // main axis alignment : start
    // cross axis alignment : center
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: defultColor,
                  ),
                )),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Manage diet plan",
          style: TextStyle(color: Colors.teal,),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatDaitePlan(
                              id: widget.id,
                            )));
              },
              icon: Icon(
                IconlyBroken.plus,
                color: Colors.teal,
              )),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('plan')
              .where('doctorId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where('patintId', isEqualTo: widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              default:
                return Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        DataTable(
                          columns: [
                            DataColumn(
                                label: Text(
                                  'FOOD',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.teal),
                                )),
                            DataColumn(
                                label: Text(
                                  'SER-SIZE',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.teal),
                                )),
                            DataColumn(
                                label: Text(
                                  'KCAL',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.teal),
                                )),
                            DataColumn(
                                label: Text(
                                  'time',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.teal),
                                )),
                          ],
                          rows: [],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = snapshot.data!.docs;
                          return buliderItems(context, data, index);
                        },
                        separatorBuilder: (context, index) =>
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 1.0,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                            ),
                        itemCount: snapshot.data!.size,
                      ),
                      /*SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [

                      /*  DataTable(columns: [
                          DataColumn(
                              label: Text(
                            'FOOD',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal),
                          )),
                          DataColumn(
                              label: Text(
                            'SER-SIZE',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal),
                          )),
                          DataColumn(
                              label: Text(
                            'KCAL',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal),
                          )),
                          DataColumn(
                              label: Text(
                            'time',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal),
                          )),
                        ], rows: [
                          DataRow(cells: [
                            DataCell(Text(
                              'MILK',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.teal),
                            )),
                            DataCell(Text(
                              'ONE CUP',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.teal),
                            )),
                            DataCell(Text(
                              '160',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.teal),
                            )),
                            DataCell(IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            )),
                          ]),
                        ]),*/
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs;
                            return buliderItems(context,data,index);
                          },
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
                  ),*/
                    ),
                  ],
                );
            }
          }),
    );
  }

  Widget buliderItems(context, data, index) => InkWell(
        onTap: () {},
        child: Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  <Widget>[
            Container(
              child: Row(
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(color: data[index]['completed'] =="false"?Colors.redAccent:Colors.green, width: 3.0),
                        color:  data[index]['completed'] =="false"?Colors.redAccent:Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {

                        },
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            data[index]['completed'] =="false"? Icons.close
                                :Icons.done,
                            size: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15.0,
                    width: 7.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['name'],
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],

              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child:Text(
                data[index]['size'],
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              )
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                data[index]['kcal'],
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              )
            ), Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                data[index]['data'],
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              )
            )
          ],
        ),

          ],
        ),
      );
}
