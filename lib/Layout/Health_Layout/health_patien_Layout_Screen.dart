
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hea_apps/Modeules/NavBar_pation/NavBar_screen.dart';
import 'package:hea_apps/Modeules/Search/Secarch_paiton_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:intl/intl.dart';

import '../../Shared/Networkes/Logical/Diohelper.dart';
import '../../services/database.dart';


class healthLayout_patien extends StatefulWidget {


  @override
  State<healthLayout_patien> createState() => _healthLayout_patienState();
}
String spizlezedName="";

String spizlezedImage="";

String spizlezedemail="";
class _healthLayout_patienState extends State<healthLayout_patien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //كيف اغير لونها
      drawer:NavBarPation() ,
       //backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Scaffold.of(context).openDrawer();},icon: Icon(Icons.menu,color: defultColor),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0.0,
        title:  Text("Home",style: TextStyle(color: defultColor),),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Search_paiton_screen(),));
              },
              icon:Icon(IconlyBroken.search,color: defultColor,)
          ),

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
                Container(
                  width: double.infinity,
                  child: Card(
                    clipBehavior:Clip.antiAliasWithSaveLayer ,
                    margin: EdgeInsets.all(8.0),
                    elevation: 8.0,
                    child: Image(
                      image:  NetworkImage("https://tse2.mm.bing.net/th?id=OIP.At9CpPJanT2mDg-DAdCJQwHaE8&pid=Api&P=0}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               ListView.separated(
                 shrinkWrap: true,
                   itemBuilder: (context, index) => buliderItems(data, context, index),
                   separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.0,),
                 itemCount: snapshot.data!.size,
               ),
               /* ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buliderItems(data, context, index),
                    itemCount: snapshot.data!.size,
                ),*/

              ],
            ),
          );
        }}
      ),

    );
  }
}





Widget buliderItems(data, context, index)=> Card(
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
              backgroundImage: NetworkImage(data[index]['userimage']),
              radius: 35.0,
            ),
            SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(data[index]['username'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,height: 1.0),),
                    SizedBox(width: 5.0,),
                    //Icon(Icons.check_circle,color: Colors.blue,size: 19.0,),
                  ],
                ),
                SizedBox(height: 5.0,),
                Text(parseTimeStamp(data[index]['date']),style: TextStyle(color: Colors.grey,fontSize: 13.0),),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_horiz_outlined,size: 18.0,),
            ),

          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:15.0),
          child: Container(
            width: double.infinity,
            color: Colors.grey[300],
            height: 1.0,

          ),
        ),
        Text(
          data[index]['decs'],
          style: Theme.of(context).textTheme.subtitle1!.copyWith(height: 1.2),
        ),
        SizedBox(height: 10.0,),
        Container(
          width: double.infinity,
          height: 180.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            image: DecorationImage(
              image: NetworkImage(data[index]['userimage']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5.0,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              InkWell(
                onTap: ()=>null,
                child: Row(
                  children: [
                    Icon(IconlyBroken.heart,color: Colors.redAccent,size: 20.0,),
                    SizedBox(width: 5.0,),
                    Text(data[index]['likecount']),
                  ],
                ),
              ),
             // Spacer(),
          /*    InkWell(
                onTap: ()=>null,
                child: Row(
                  children: [
                    Icon(IconlyBroken.chat,color: Colors.grey,size: 20.0,),
                    SizedBox(width: 5.0,),
                    //Text("120 comment",style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),),
                  ],
                ),
              ),*/
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:15.0),
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
                    backgroundImage: NetworkImage(Diohelper.GetData(key: "UserImage")),
                  ),
                  SizedBox(width: 5.0,),
                 // Expanded(child: InkWell(onTap: (){},child: Text("writte communt",style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey,fontSize: 14.0),))),
                ],
              ),
            ),
            InkWell(
              onTap: ()=>{
                DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                    .updateLikeCount(
                    data[index]['id'],
                    ((int.parse(data[index]['likecount'])) + 1)
                        .toString())
              },
              child: Row(
                children: [
                  Icon(IconlyBroken.heart,size: 20.0,color: Colors.grey,),
                  SizedBox(width: 5.0,),
                  Text("Like",style: Theme.of(context).textTheme.caption!.copyWith(fontSize:16.0 ),),
                ],
              ),
            )
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




@override
void initState() {
  user(FirebaseAuth
      .instance.currentUser!.uid).forEach((element) {


    spizlezedName=element.docs[0]['name'];
    spizlezedImage=element.docs[0]['myImage'];
    spizlezedemail=element.docs[0]['email'];



  });
}

Stream<QuerySnapshot<Map<String, dynamic>>>  user(String userId) {
  return   FirebaseFirestore.instance.collection('user').where('uid', isEqualTo: userId).snapshots();
}