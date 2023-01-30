import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Rate_nutritionist/Rating_Dialog/Rating_Nurtion_Screen_dialoge.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../../../Shared/Networkes/Logical/Diohelper.dart';
import '../../../services/database.dart';

class Chatdetailes extends StatefulWidget {
  const Chatdetailes({Key? key, required this.chatColectionId,required this.typeSubscribtion,required this.name,required this.image})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String chatColectionId;
  final String typeSubscribtion;
  final String name;
  final String image;

  @override
  State<Chatdetailes> createState() => _ChatdetailesState();
}

class _ChatdetailesState extends State<Chatdetailes> {
  String mytext = '';
  String chatId = "";
  final _formKey = GlobalKey<FormState>();
  String myId = FirebaseAuth.instance.currentUser!.uid;
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(myId);
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .doc(widget.chatColectionId)
            .collection("ChatModel")
            .orderBy("messageTime")
            .snapshots(),
        builder: (context, snapshot) {
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
              actions: [
                MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 1.0,
                  onPressed: () {
                    OpenRatingDialog(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: defultColor,
                        size: 17.0,
                      ),
                      Text(
                        "Rating",
                        style: TextStyle(color: defultColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 7.0,
                ),
                MaterialButton(
                  padding: EdgeInsets.zero,
                  minWidth: 1.0,
                  onPressed: () {
                   setState(() {
                     DatabaseService(
                         uid: FirebaseAuth
                             .instance.currentUser!.uid)
                         .updateSubscribtion(widget.chatColectionId, widget.typeSubscribtion == "unSubscription" ? "Subscription":"unSubscription");
                   });
                  },
                  child: Row(
                    children: [
                        Text(
                        Diohelper.GetData(key: "Usertype") == "specialized" ? widget.typeSubscribtion == "unSubscription" ?"Subscription":"unSubscription":"",
                        style: TextStyle(color: defultColor),
                      ),
                    ],
                  ),
                ),
              ],
              elevation: 0.0,
              titleSpacing: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    child: ClipOval(
                      child: Image(
                        image: NetworkImage(widget.image),
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
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: defultColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {

                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Center(child: new CircularProgressIndicator());
                        default:
                          final data = snapshot.data!.docs;

                          return Align(
                alignment: data[index]['sender'] == myId
                    ? AlignmentDirectional.centerStart
                    : AlignmentDirectional.centerEnd,
                child: Container(
                  decoration: BoxDecoration(
                    color: data[index]['sender'] == myId
                        ? Colors.grey[300]
                        : defultColor,
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(10.0),
                      topStart: Radius.circular(10.0),
                      topEnd: Radius.circular(10.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: Text(data[index]['message']),
                ),
              );
                   }
                      },
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 0.0,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                      ),
                      itemCount: snapshot.data!.size,
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "tupr your message here...",
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "You must add text ";
                              }
                            },
                            onChanged: (val) {
                              setState(() => mytext = val);
                            },
                          )),
                          Container(
                            //  height: 10.0,
                            //  color: defultColor,
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print(widget.chatColectionId);
                                  DatabaseService(
                                          uid: FirebaseAuth
                                              .instance.currentUser!.uid)
                                      .addMessageChat(
                                          widget.chatColectionId,
                                          myId,
                                          mytext,
                                          (DateTime.now()
                                                  .millisecondsSinceEpoch)
                                              .toString());
                                  _controller.clear();
                                }
                              },
                              minWidth: 1.0,
                              child: Text(
                                "Send",
                                style: TextStyle(
                                  color: defultColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  OpenRatingDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Dialog(
              child: Rating_Nurtions(),
            ),
          );
        });
  }
}
/*Icon(
IconlyBroken.send,
size: 16.0,
color: Colors.white,
),
*/
