import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Manage%20Diet%20plan/Manage_Diet_plan_Screen.dart';
import 'package:hea_apps/Modeules/Management_profilr/Informa_profile/Informa_profile.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

class Patients_who_pay_Screen extends StatefulWidget {
  @override
  State<Patients_who_pay_Screen> createState() =>
      _Patients_who_pay_ScreenState();
}

class _Patients_who_pay_ScreenState extends State<Patients_who_pay_Screen> {
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
          "Manage Diet plan  ",
          style: TextStyle(color: defultColor, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chat')
              .where('userOwnerItemId',
              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where('subscribtion', isEqualTo: 'Subscription')
              .snapshots(),
          builder: (context, snapshot) {
            return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                            child: new CircularProgressIndicator());
                      default:
                        final data = snapshot.data!.docs;
                        return buliderItems(context, data, index);
                    }
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
          }),
    );
  }
}

Widget buliderItems(context, data, index) => InkWell(
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
                      image: NetworkImage(data[index]['imageUser'] == null
                          ? ""
                          : data[index]['imageUser']),
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
                        data[index]['nameUser'],
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        "juun20/22/9 ",
                        style: TextStyle(
                            fontSize: 17.0, color: Colors.grey[400]),
                      ),
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
                          builder: (context) => Manage_diet_plans(
                              id: data[index]['userLoginId'])));
                },
                minWidth: 1.0,
                padding: EdgeInsets.zero,
                child: Text(
                  "Make a plan",
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