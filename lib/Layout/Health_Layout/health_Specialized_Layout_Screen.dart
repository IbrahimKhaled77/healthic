import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Icons/icons.dart';
import 'package:hea_apps/Layout/Cuibt_Layout_health_pation/cubit.dart';
import 'package:hea_apps/Layout/Cuibt_Layout_health_pation/states_pation.dart';
import 'package:hea_apps/Modeules/Creat_new_post/Creat_new_post_screen.dart';
import 'package:hea_apps/Modeules/NavBar_Specialized/NavBar_Speizled.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

import '../../services/database.dart';

class healthLayout_Specialized extends StatefulWidget {
  @override
  State<healthLayout_Specialized> createState() =>
      _healthLayout_SpecializedState();
}

class _healthLayout_SpecializedState extends State<healthLayout_Specialized> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print(user.uid);
      }
    });
    return Scaffold(
      //كيف اغير لونها
      drawer: NavBar_Specialized(),
      //backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: defultColor,
              ),
            )),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Home Specialized",
          style: TextStyle(
            color: defultColor,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          /* IconButton(
                    onPressed: (){},
                    icon:Icon(IconlyBroken.search,color: defultColor,)
                ),
                IconButton(
                    onPressed: (){},
                    icon:Icon(Icons.dark_mode,color: defultColor,)
                ),*/
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('post').where('accept', isEqualTo: 'true').snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              default:
                final data = snapshot.data!.docs;
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            //margin: EdgeInsets.all(8.0),
                            elevation: 8.0,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundImage: NetworkImage(
                                                "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740&t=st=1666537051~exp=1666537651~hmac=e6535f48409fec3e96d8f2ed0985f5ea33611d5b1d2151dab1f92faf06435526"),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Expanded(
                                              child: InkWell(
                                                  onTap: () => {
                                                    /* Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                CreatNewPost()));*/
                                                    DatabaseService(
                                                        uid: FirebaseAuth
                                                            .instance.currentUser!.uid).getUserInfo(FirebaseAuth.instance.currentUser!.uid).forEach((element) {
                                                      var x=element.docs[0];
                                                      if(x['caneSearch'] == "false"){
                                                        showTost("you account not accept yet ");


                                                      }else{
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    CreatNewPost(


                                                                    )));
                                                      }

                                                    })
                                                  },
                                                  child: Text(
                                                    "Create post",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                        color: Colors.grey,
                                                        fontSize: 14.0),
                                                  ))),
                                        ],
                                      ),
                                    ),
                                    // Spacer(),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.grey[300],
                                    height: 1.0,
                                  ),
                                ),
                                Row(
                                  children: [
                                    /*  Expanded(
                                      child: InkWell(
                                        onTap: ()=> CubitE.getImageProfile(),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(IconlyBroken.image,size: 20.0,color: Colors.grey,),
                                            SizedBox(width: 5.0,),
                                            Text("Image",style: Theme.of(context).textTheme.caption!.copyWith(fontSize:16.0 ),),
                                          ],
                                        ),
                                      ),
                                    ),*/
                                    Expanded(
                                      child: InkWell(
                                        onTap: () => null,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              IconlyBroken.send,
                                              size: 20.0,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              "Post",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            buliderItems(data, context, index),
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
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(data[index]['userimage']),
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
                    SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
                Text(
                  parseTimeStamp(data[index]['date']),
                  style: TextStyle(color: Colors.grey, fontSize: 13.0),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz_outlined,
                size: 18.0,
              ),
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
        SizedBox(
          height: 6.0,
        ),
        Container(
          width: double.infinity,
          height: 150.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            image: DecorationImage(
              image: NetworkImage(
                data[index]['userimage'],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              InkWell(
                onTap: () => null,
                child: Row(
                  children: [
                    Icon(
                      IconlyBroken.heart,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(data[index]['likecount']),
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () => null,
                child: Row(
                  children: [
                    Icon(
                      IconlyBroken.chat,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "120 comment",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=740&t=st=1666537051~exp=1666537651~hmac=e6535f48409fec3e96d8f2ed0985f5ea33611d5b1d2151dab1f92faf06435526"),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                      child: InkWell(
                          onTap: () {},
                          child: Text(
                            "writte communt",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                color: Colors.grey, fontSize: 14.0),
                          ))),
                ],
              ),
            ),
            // Spacer(),
            InkWell(
              onTap: () => {
                DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                    .updateLikeCount(
                    data[index]['id'],
                    ((int.parse(data[index]['likecount'])) + 1)
                        .toString())
              },
              child: Row(
                children: [
                  Icon(
                    IconlyBroken.heart,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Like",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 16.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  ),
);
void showTost(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
String parseTimeStamp(String value) {
  var c = int.parse(value);
  var date = DateTime.fromMillisecondsSinceEpoch(c * 1000);
  var d12 = DateFormat('MM-dd hh:mm a').format(date);
  return d12;
}