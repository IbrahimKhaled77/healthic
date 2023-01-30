import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Modeules/Forgot_password/Forgot_password_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../../Layout/Health_Layout/health_patien_Layout_Screen.dart';
import '../../models/pointmodel.dart';
import '../../services/database.dart';
import '../Search/Secarch_paiton_screen.dart';

class booked_appointment_online_screen extends StatefulWidget {
  const booked_appointment_online_screen(
      {Key? key, required this.id, required this.type, required this.name,required this.image})
      : super(key: key);

// Step 2 <-- SEE HERE
  final String id;
  final String type;
  final String name;
  final String image;

  @override
  State<booked_appointment_online_screen> createState() =>
      _booked_appointment_online_screenState();
}

List<PointModel> sun = [
  PointModel(type: "online", avilable: false, date: "Sun"),
  PointModel(type: "online", avilable: true, date: "1-2"),
  PointModel(type: "online", avilable: true, date: "2-3"),
  PointModel(type: "online", avilable: true, date: "3-4"),
  PointModel(type: "online", avilable: true, date: "4-5"),
  PointModel(type: "online", avilable: true, date: "5-6")
];
List<PointModel> mon = [
  PointModel(type: "online", avilable: false, date: "mon"),
  PointModel(type: "online", avilable: true, date: "1-2"),
  PointModel(type: "online", avilable: true, date: "2-3"),
  PointModel(type: "online", avilable: true, date: "3-4"),
  PointModel(type: "online", avilable: true, date: "4-5"),
  PointModel(type: "online", avilable: true, date: "5-6")
];
List<PointModel> tue = [
  PointModel(type: "online", avilable: false, date: "tue"),
  PointModel(type: "online", avilable: true, date: "1-2"),
  PointModel(type: "online", avilable: true, date: "2-3"),
  PointModel(type: "online", avilable: true, date: "3-4"),
  PointModel(type: "online", avilable: true, date: "4-5"),
  PointModel(type: "online", avilable: true, date: "5-6")
];
List<PointModel> wed = [
  PointModel(type: "online", avilable: false, date: "wed"),
  PointModel(type: "online", avilable: true, date: "1-2"),
  PointModel(type: "online", avilable: true, date: "2-3"),
  PointModel(type: "online", avilable: true, date: "3-4"),
  PointModel(type: "online", avilable: true, date: "4-5"),
  PointModel(type: "online", avilable: true, date: "5-6")
];
List<PointModel> fri = [
  PointModel(type: "online", avilable: false, date: "fri"),
  PointModel(type: "online", avilable: true, date: "1-2"),
  PointModel(type: "online", avilable: true, date: "2-3"),
  PointModel(type: "online", avilable: true, date: "3-4"),
  PointModel(type: "online", avilable: true, date: "4-5"),
  PointModel(type: "online", avilable: true, date: "5-6")
];
bool flag = false;
String patintName = "";
String spizlezedName = "";
String patintImage = "";
String spizlezedImage = "";

class _booked_appointment_online_screenState
    extends State<booked_appointment_online_screen> {
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
        title: Text(
          (widget.type) =="online"? "Book appointment online":"Book appointment clinic",
          style: TextStyle(
            color: defultColor,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('appointment')
              .where('uidspitizet', isEqualTo: widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data?.docs;
            data?.forEach((element) {
              if (element['day'] == "sun") {
                sun.forEach((sunelement) {
                  if (sunelement.date == element['time']) {
                    print(element['time'] + "sun");
                    sunelement.avilable = !sunelement.avilable;
                  }
                });
              }
              if (element['day'] == "mon") {
                mon.forEach((sunelement) {
                  if (sunelement.date == element['time']) {
                    print(element['time'] + "mon");
                    sunelement.avilable = !sunelement.avilable;
                  }
                });
              }
              if (element['day'] == "tue") {
                tue.forEach((sunelement) {
                  if (sunelement.date == element['time']) {
                    print(element['time'] + "tue");
                    sunelement.avilable = !sunelement.avilable;
                  }
                });
              }
              if (element['day'] == "wed") {
                wed.forEach((sunelement) {
                  if (sunelement.date == element['time']) {
                    print(element['time'] + "wed");
                    sunelement.avilable = !sunelement.avilable;
                  }
                });
              }
              if (element['day'] == "fri") {
                fri.forEach((sunelement) {
                  if (sunelement.date == element['time']) {
                    print(element['time'] + "fri");
                    sunelement.avilable = !sunelement.avilable;
                  }
                });
              }
            });

            return Padding(
              padding: EdgeInsetsDirectional.all(7.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage: (NetworkImage(
                                widget.image)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 90.0, top: 10.0),
                                  child: Text(
                                    '',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: defultColor,
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              (widget.type) =="online"? "Book appointment online":"Book appointment clinic",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),//theghost12345678902001@gm
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 600,
                            child: ListView.separated(itemBuilder:(BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                                  color: sun[index].avilable
                                      ? Colors.green[100]
                                      : defultColor,
                                ),
                                child: MaterialButton(
                                  child: Text(sun[index].date,),
                                  onPressed: () {
                                    //  print(sun[index].avilable.toString());
                                    if (sun[index].avilable == true) {
                                      sun[index].avilable =
                                      !sun[index].avilable;
                                      addappoint(
                                          FirebaseAuth
                                              .instance.currentUser!.uid,
                                          widget.id,
                                          sun[index].date,
                                          "sun",
                                          sun[index].type,
                                          "pending");
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  healthLayout_patien()),
                                              (route) => false);
                                      Fluttertoast.showToast(
                                          msg: "Thanks for appointment we will back soon",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );

                                    }
                                  },
                                ),
                              );
                            }, scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8),
                                separatorBuilder: (context, index) => SizedBox(width: 5.0,)
                            , itemCount: sun.length)

                      ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 50,
                            width: 600,
                           child: ListView.separated(
                               scrollDirection: Axis.horizontal,
                               padding: const EdgeInsets.all(8),
                               itemBuilder: (BuildContext context, int index) {
                                 return Container(
                                   decoration: BoxDecoration(
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(12.0)),
                                     color: mon[index].avilable
                                         ? Colors.green[100]
                                         : defultColor,
                                   ),
                                   child: MaterialButton(
                                     child: Text(mon[index].date),
                                     onPressed: () {
                                       //  print(sun[index].avilable.toString());
                                       setState(() {
                                         if (mon[index].avilable == true) {
                                           mon[index].avilable =
                                           !mon[index].avilable;
                                           addappoint(
                                               FirebaseAuth
                                                   .instance.currentUser!.uid,
                                               widget.id,
                                               sun[index].date,
                                               "mon",
                                               sun[index].type,
                                               "pending");
                                           Navigator.pushAndRemoveUntil(
                                               context,
                                               MaterialPageRoute(
                                                   builder: (context) =>
                                                       healthLayout_patien()),
                                                   (route) => false);
                                           Fluttertoast.showToast(
                                               msg: "Thanks for appointment we will back soon",
                                               toastLength: Toast.LENGTH_SHORT,
                                               gravity: ToastGravity.CENTER,
                                               timeInSecForIosWeb: 1,
                                               textColor: Colors.white,
                                               fontSize: 16.0
                                           );
                                         }
                                       });
                                     },
                                   ),
                                 );
                               },
                               separatorBuilder:(context, index) => SizedBox(width: 5.0,),
                               itemCount:  mon.length
                           ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            height: 50,
                            width: 600,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                      color: tue[index].avilable
                                          ? Colors.green[100]
                                          : defultColor,
                                    ),
                                    child: MaterialButton(
                                      child: Text(tue[index].date),
                                      onPressed: () {
                                        //  print(sun[index].avilable.toString());
                                        setState(() {
                                          if (tue[index].avilable == true) {
                                            tue[index].avilable =
                                            !tue[index].avilable;
                                            addappoint(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid,
                                                widget.id,
                                                sun[index].date,
                                                "tue",
                                                sun[index].type,
                                                "pending");
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        healthLayout_patien()),
                                                    (route) => false);
                                            Fluttertoast.showToast(
                                                msg: "Thanks for appointment we will back soon",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }
                                        });
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(width: 5.0,),
                                itemCount: tue.length,
                            ),

                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            height: 50,
                            width: 600,
                           child: ListView.separated(
                             scrollDirection: Axis.horizontal,
                             padding: const EdgeInsets.all(8),
                               itemBuilder: (BuildContext context, int index) {
                                 return Container(
                                   decoration: BoxDecoration(
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(12.0)),
                                     color: wed[index].avilable
                                         ? Colors.green[100]
                                         : defultColor,
                                   ),
                                   child: MaterialButton(
                                     child: Text(wed[index].date),
                                     onPressed: () {
                                       //  print(sun[index].avilable.toString());
                                       setState(() {
                                         if (wed[index].avilable == true) {
                                           wed[index].avilable =
                                           !wed[index].avilable;
                                           addappoint(
                                               FirebaseAuth
                                                   .instance.currentUser!.uid,
                                               widget.id,
                                               sun[index].date,
                                               "wed",
                                               widget.type,
                                               "pending");
                                           Navigator.pushAndRemoveUntil(
                                               context,
                                               MaterialPageRoute(
                                                   builder: (context) =>
                                                       healthLayout_patien()),
                                                   (route) => false);
                                           Fluttertoast.showToast(
                                               msg: "Thanks for appointment we will back soon",
                                               toastLength: Toast.LENGTH_SHORT,
                                               gravity: ToastGravity.CENTER,
                                               timeInSecForIosWeb: 1,
                                               textColor: Colors.white,
                                               fontSize: 16.0
                                           );
                                         }
                                       });
                                     },
                                   ),
                                 );
                               },
                               separatorBuilder:  (context, index) => SizedBox(width: 5.0,),
                               itemCount: wed.length,
                           ),

                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            height: 50,
                            width: 600,
                           child: ListView.separated(
                             scrollDirection: Axis.horizontal,
                             padding: const EdgeInsets.all(8),
                               itemBuilder: (BuildContext context, int index) {
                                 return Container(
                                   decoration: BoxDecoration(
                                     borderRadius:
                                     BorderRadius.all(Radius.circular(12.0)),
                                     color: fri[index].avilable
                                         ? Colors.green[100]
                                         : defultColor,
                                   ),
                                   child: MaterialButton(
                                     child: Text(fri[index].date),
                                     onPressed: () {
                                       //  print(sun[index].avilable.toString());
                                       setState(() {
                                         if (fri[index].avilable == true) {
                                           fri[index].avilable =
                                           !fri[index].avilable;
                                           addappoint(
                                               FirebaseAuth
                                                   .instance.currentUser!.uid,
                                               widget.id,
                                               sun[index].date,
                                               "fri",
                                               sun[index].type,
                                               "pending");
                                           Navigator.pushAndRemoveUntil(
                                               context,
                                               MaterialPageRoute(
                                                   builder: (context) =>
                                                       healthLayout_patien()),
                                                   (route) => false);
                                           Fluttertoast.showToast(
                                               msg: "Thanks for appointment we will back soon",
                                               toastLength: Toast.LENGTH_SHORT,
                                               gravity: ToastGravity.CENTER,
                                               timeInSecForIosWeb: 1,
                                               textColor: Colors.white,
                                               fontSize: 16.0
                                           );
                                         }
                                       });
                                     },
                                   ),
                                 );
                               },
                               separatorBuilder:(context, index) => SizedBox(width: 5.0,),
                               itemCount: fri.length,
                           ),
                           /* child: ListView.builder(
                              itemCount: fri.length,
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    color: fri[index].avilable
                                        ? Colors.green[100]
                                        : defultColor,
                                  ),
                                  child: MaterialButton(
                                    child: Text(fri[index].date),
                                    onPressed: () {
                                      //  print(sun[index].avilable.toString());
                                      setState(() {
                                        if (fri[index].avilable == true) {
                                          fri[index].avilable =
                                              !fri[index].avilable;
                                          addappoint(
                                              FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              widget.id,
                                              sun[index].date,
                                              "fri",
                                              sun[index].type,
                                              "pending");
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      healthLayout_patien()),
                                              (route) => false);
                                          Fluttertoast.showToast(
                                              msg: "Thanks for appointment we will back soon",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                        }
                                      });
                                    },
                                  ),
                                );
                              },
                            ),*/
                          ),
                          SizedBox(height: 10.0,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );

  }




  void addappoint(String uidpatint, String uidspitizet, String time, String day,
      String typeappointment, String status) {
    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).addAppointment(
        uidpatint,
        uidspitizet,
        time,
        day,
        typeappointment,
        status,
        patintName,
        spizlezedName,
        patintImage,
        spizlezedImage);
  }


  Stream<QuerySnapshot<Map<String, dynamic>>> user(String userId) {
    return FirebaseFirestore.instance
        .collection('user')
        .where('uid', isEqualTo: userId)
        .snapshots();
  }

  @override
  void initState() {
    user(FirebaseAuth.instance.currentUser!.uid).forEach((element) {
      print(element.docs[0]['name']);
      patintName = element.docs[0]['name'];
      patintImage = element.docs[0]['myImage'];
    });
    user(widget.id).forEach((element) {
      print(element.docs[0]['name']);
      spizlezedName = element.docs[0]['name'];
      spizlezedImage = element.docs[0]['myImage'];
    });
  }
}
