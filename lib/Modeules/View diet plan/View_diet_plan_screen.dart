

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../../services/database.dart';


class View_diet_plan extends StatefulWidget {

  const View_diet_plan({
    Key? key,
    required this.id,
  }) : super(key: key);

  // Step 2 <-- SEE HERE
  final String id;
  @override
  State<View_diet_plan> createState() => _View_diet_planState();
}

class _View_diet_planState extends State<View_diet_plan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor,),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("View diet plan", style: TextStyle(color:defultColor,fontStyle: FontStyle.normal),),
        actions: [



        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('plan')
            .where('patintId',
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where('doctorId', isEqualTo: widget.id)
            .snapshots(),
        builder: (context, snapshot) {
          return ListView(
            padding: EdgeInsets.only(top: 10.0),
            children: [
              SizedBox(
                height: 15.0,
              ),
              Padding(padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text('Are you ready?',
                      style: TextStyle(
                        color: defultColor,
                        fontSize: 25.0,
                        fontWeight: FontWeight.normal,
                      ),),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height-85.0,
                decoration: BoxDecoration(
                    color: defultColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(75.0),topLeft: Radius.circular(75.0))
                ),
                child:  SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                                itemBuilder: (context, index) {
                switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
                default:
                final data = snapshot.data!.docs;
                  return _buildFoodItem(context, data, index);
    }
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
                /*ListView(
                  padding: EdgeInsets.only(left: 24.0,right: 24.0),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height-300,
                      child: ListView(
                        children: [
                          _buildFoodItem('FoodName','Calorie'),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),



                  ],
                ),*/
              ),
            ],
          );
        }
      ),
    );
  }
}


Widget _buildFoodItem (context, data, index){
  return Padding(padding: EdgeInsets.only(left: 14.0,top: 10.0),
    child: InkWell( child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Row(
            children: [
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color:data[index]['completed'] =="false"? Colors.redAccent:Colors.green, width: 3.0),
                    color:  data[index]['completed'] =="false"?Colors.redAccent:Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {
                      DatabaseService(
                          uid: FirebaseAuth
                              .instance.currentUser!.uid).updatecompleted(data[index]['id'], "true");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        data[index]['completed'] =="false"? Icons.close
                        :Icons.done,
                        size: 12.0,
                        color: Colors.white
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
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],

          ),
        ),
        Text(
          data[index]['size'],
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          data[index]['kcal'],
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          data[index]['data'],
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),

    ),
  );
}
