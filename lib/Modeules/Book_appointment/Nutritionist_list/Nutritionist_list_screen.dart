import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Book_appointment/booked_appointment_clinic_screen.dart';
import 'package:hea_apps/Modeules/Book_appointment/booked_appointment_online_screen.dart';
import 'package:hea_apps/Modeules/NavBar_pation/NavBar_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../../../services/database.dart';

class Nutritionist_list_you extends StatefulWidget {
  @override
  State<Nutritionist_list_you> createState() => _Nutritionist_list_youState();
}

class _Nutritionist_list_youState extends State<Nutritionist_list_you> {
  var searchFieldController = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        drawer: NavBarPation(),
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
    title: Text(
    "Nutrition experts you contact",
    style: TextStyle(color: defultColor),
    ),
    ),
    body: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('appointment')
        .where('uidpatint',
    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots(),
    builder: (context, snapshot) {
    switch (snapshot.connectionState) {
    case ConnectionState.waiting:
    return new Center(child: new CircularProgressIndicator());
    default:
    return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
    children: [
    ListView.separated(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
    final data = snapshot.data!.docs;
    return listItem(context,data,index);
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
    );
    }},
    ),
    ));
    }

    Column listItem(BuildContext context,data,index) {

    return Column(children: [
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
    image:NetworkImage(data[index]['imagespitizet']),
    height: 90.0,
    width: 90.0,
    fit: BoxFit.cover,
    ),
    ),
    ),
    SizedBox(
    width: 10.0,
    ),
    Container(
    width: 250,
    child: Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    mainAxisAlignment:
    MainAxisAlignment.start,
    children: [
    Row(
    children: [
    Expanded(
    child: Column(
    crossAxisAlignment:
    CrossAxisAlignment
        .start,
    mainAxisAlignment:
    MainAxisAlignment
        .start,
    children: [
    Padding(
    padding:
    const EdgeInsetsDirectional
        .only(
    top: 21.0),
    child: Text(
    data[index]['namespitizet'],
    style: TextStyle(
    fontSize: 17.0,
    fontWeight:
    FontWeight
        .bold,
    ),
    maxLines: 1,
    // overflow:TextOverflow.ellipsis,
    ),
    ),
    SizedBox(
    height: 6.0,
    ),
    Row(
    mainAxisAlignment:
    MainAxisAlignment
        .start,
    children: [
    Text.rich(
    TextSpan(
    children: [
    TextSpan(
    text: data[index]['status'],
    style: Theme.of(
    context)
        .textTheme
        .subtitle2,
    ),
    ],
    ),
    ),
    Icon(
    Icons.star,
    color:
    defultColor,
    size: 16.0,
    ),
    ],
    ),
    SizedBox(
    height: 10.0,
    ),
    ],
    ),
    ),
    MaterialButton(
    minWidth: 1.0,
    textColor: defultColor,
    onPressed: () {
    /*Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                booked_appointment_online_screen(
                                                                  id: "",
                                                                )));*/
    },
    child: Text(
    data[index]['typeappointment'],
    ),
    ),
    MaterialButton(
    minWidth: 1.0,
    textColor: defultColor,
    onPressed: () {
    /*Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                booked_appointment_clinic_screen()));*/
    },
    child: Text(
    data[index]['time']+" PM",
    ),
    ),
    ],
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
    ]);
    }


  }
