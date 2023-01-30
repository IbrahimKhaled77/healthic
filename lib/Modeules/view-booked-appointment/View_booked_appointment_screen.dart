

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/models/chat/message_model.dart';
import 'package:oktoast/oktoast.dart';
import '../../services/database.dart';

class view_booked_appoiemnts extends StatefulWidget {
  const view_booked_appoiemnts({Key? key, required this.myday}) : super(key: key);

  // Step 2 <-- SEE HERE
  final String myday;

  @override
  State<view_booked_appoiemnts> createState() => _view_booked_appoiemntsState();
}


class _view_booked_appoiemntsState extends State<view_booked_appoiemnts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 0.0,
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
          title: const Text(
            " view Book appointment",
            style: TextStyle(
              color: Colors.teal,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dark_mode,
                )),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('appointment')
                .where('uidspitizet', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .where('status', isEqualTo: "pending")
                .where('day', isEqualTo: widget.myday)
                .snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Center(child: new CircularProgressIndicator());
                default:
                  return Padding(
                      padding: const EdgeInsetsDirectional.all(7.0),
                      child: Container(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  const Text(
                                    'Good Mording Dr.ABD',
                                    style: TextStyle(
                                        fontSize: 20.0, fontWeight: FontWeight.bold,color:Colors.teal,

                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 8.0),
                                    child: Text(
                                      'you have 7 pation booked',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15.0,),
                                  Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            children: [
                                              //today
                                              CircleAvatar(
                                                  radius: 31.0,
                                                  backgroundColor: widget.myday ==
                                                      "sun" ? Colors.teal : Colors
                                                      .green[100],
                                                  child: MaterialButton(
                                                    child: const Text('Sun',textAlign: TextAlign.center,style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                    ),),
                                                    onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => view_booked_appoiemnts(myday: "sun",)));
                                                    },
                                                  )),
                                              const SizedBox(width: 10.0,),
                                              CircleAvatar(radius: 31.0, backgroundColor: widget.myday == "mon" ? Colors.teal : Colors.green[100],
                                                  child: MaterialButton(
                                                    child: const Text('Mon',textAlign: TextAlign.center,style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                    ),),
                                                    onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => view_booked_appoiemnts(myday: "mon",)));
                                                    },
                                                  )),
                                              const SizedBox(width: 10.0,),
                                              CircleAvatar(radius: 31.0, backgroundColor: widget.myday == "tue" ? Colors.teal : Colors.green[100],
                                                  child: MaterialButton(
                                                    child: const Text('Tus',textAlign: TextAlign.center,style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => view_booked_appoiemnts(myday: "tue",)));
                                                    },
                                                  )),
                                              const SizedBox(width: 10.0,),
                                              CircleAvatar(
                                                  radius: 31.0,
                                                  backgroundColor: widget.myday == "wed" ? Colors.teal : Colors.green[100],
                                                  child: MaterialButton(
                                                    child: const Text('Wed',textAlign: TextAlign.center,style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => view_booked_appoiemnts(myday: "wed",)),);
                                                    },
                                                  )),
                                              const SizedBox(width: 10.0,),
                                              CircleAvatar(
                                                  radius: 30.0,
                                                  backgroundColor: widget.myday == "fri" ? Colors.teal : Colors.green[100],
                                                  child: MaterialButton(
                                                    child: const Text('Fri',textAlign: TextAlign.center,style: TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.bold,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => view_booked_appoiemnts(myday: "fri",)));
                                                    },
                                                  )),
                                              const SizedBox(width: 10.0,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25.0,),
                                  const Text(
                                    'Reservations',
                                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 25.0,),
                                  Container(
                                    padding: const EdgeInsetsDirectional.all(
                                        10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.teal,
                                    ),
                                    child: SingleChildScrollView(
                                      child: buildColumn(snapshot),
                                    ),
                                  ),
                                ]),
                          )));
              }
            }));
  }

  Column buildColumn(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return Column(
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final _data = snapshot.data!.docs;
            return Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.teal[400],
                  ),
                  child: Row(
                    children: [
                       CircleAvatar(
                        radius: 36.0,
                        backgroundImage: NetworkImage(_data[index]['imagepatint']),
                      ),
                       SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _data[index]['namepaint'],
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            _data[index]['time'],
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.green[100],
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                DatabaseService(
                                        uid: FirebaseAuth
                                            .instance.currentUser!.uid)
                                    .update(_data[index]['key'], "accept")
                                    .then((value) {

                                  DatabaseService(
                                      uid: FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .addNewChat(_data[index]['uidpatint'],_data[index]['namespitizet'],_data[index]['namepaint'],"",
                                      _data[index]['imagespitizet'],(DateTime.now().millisecondsSinceEpoch).toString(),_data[index]['imagepatint'],"unSubscription"
                                  );
                                  buildShowToast("Accept appointment");

                                });
                              });
                            },
                            child: const Image(
                                image: AssetImage('assert/image/accept.png')),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.green[100],
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                DatabaseService(
                                        uid: FirebaseAuth
                                            .instance.currentUser!.uid)
                                    .update(_data[index]['key'], "cancel")
                                    .then((value) {
                                  buildShowToast("Cancel appointment");
                                });
                              });
                            },
                            child: const Image(
                                image: AssetImage('assert/image/reject.png')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
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
    );
  }

  ToastFuture buildShowToast(String message) {
    return showToast(
        message,
      duration: Duration(seconds: 2),
      position: ToastPosition.bottom,
      backgroundColor: Colors.white,
      radius: 5.0,
      textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
    );
  }
}
