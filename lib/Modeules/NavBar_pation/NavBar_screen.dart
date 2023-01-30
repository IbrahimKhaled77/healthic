
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hea_apps/Icons/icons.dart';
import 'package:hea_apps/Modeules/Book_appointment/Nutritionist_list/Nutritionist_list_screen.dart';
import 'package:hea_apps/Modeules/Chat_pation/Chat_patient_screen.dart';
import 'package:hea_apps/Modeules/Edit_profile_patien/Edit_Profile_patien_screen.dart';
import 'package:hea_apps/Modeules/Manage_patient_bynutritionist/Manage_nutritionist_screen.dart';
import 'package:hea_apps/Modeules/Manage_picture_patien/Manage_picture_patien_screen.dart';
import 'package:hea_apps/Modeules/Profile_patient/Profile_patient_screen.dart';
import 'package:hea_apps/Modeules/Setting_patien/Setting_patien_screen.dart';
import 'package:hea_apps/Modeules/Track_adiet_plan/Track_adiet_plan_screen.dart';
import 'package:hea_apps/Modeules/View%20diet%20plan/View_diet_plan_screen.dart';
import 'package:hea_apps/Modeules/online_payment/Nutritionist_pay/Nutritionist_pay_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../../Shared/Networkes/Logical/Diohelper.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../Login_heath/LoginScreen_heath.dart';
import '../My_dite_plan_list_screen/My_DatePlan_listScreen.dart';
import 'dart:io' show Platform, exit;
class NavBarPation extends StatefulWidget {

  @override
  State<NavBarPation> createState() => _NavBarPationState();
}

class _NavBarPationState extends State<NavBarPation> {
  List<ListTile>a=[];
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {

    return Container(
     // color: Colors.black,
      child: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(Diohelper.GetData(key: "UserNmae")),
                accountEmail: Text(FirebaseAuth.instance.currentUser!.email.toString()),
                currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(Diohelper.GetData(key: "UserImage"),width: 90,height: 90,fit: BoxFit.cover,),
                ),

                ),
            decoration: BoxDecoration(
              image: DecorationImage(

                image: NetworkImage(Diohelper.GetData(key: "myCover")==""?'https://tse2.mm.bing.net/th?id=OIP.At9CpPJanT2mDg-DAdCJQwHaE8&pid=Api&P=0}':Diohelper.GetData(key: "myCover")),
                fit: BoxFit.cover,
              ),
            ),
            ),
           /* ListTile(
              leading: Icon(Icons.manage_accounts_outlined,color:defultColor,),
              title: Text("Manage nutritionist",style: TextStyle(color: defultColor ,),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Manage_Nutritionist_by_patient_screen()));
              },
            ),*/
            ListTile(
              leading: Icon(IconlyBroken.chat,color: defultColor,),
              title: Text("chat with patient ",style: TextStyle(color: defultColor,)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>Chat_patient_screen()));
              },
            ),
            ListTile(
              leading: Icon(IconlyBroken.camera,color: defultColor,),
              title: Text("Manage picture",style: TextStyle(color: defultColor,)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Manage_picturePatien()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(IconlyBroken.calendar,color: defultColor,),
              title: Text("My appointment",style: TextStyle(color: defultColor,)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Nutritionist_list_you()));
              },
            ),
            ListTile(
              leading: Icon(IconlyBroken.bookmark,color: defultColor,),
              title: Text("My diet plan",style: TextStyle(color: defultColor,)),
              onTap: (){
              //  Navigator.push(context,MaterialPageRoute(builder: (context)=>View_diet_plan()));
                Navigator.push(context,MaterialPageRoute(builder: (context)=>My_DatePlan_listScreen()));

              },
            ),
           /* ListTile(
              leading: Icon(Icons.track_changes,color: defultColor,),
              title: Text("Track diet plan",style: TextStyle(color: defultColor,)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Track_diet_plan()));
              },
            ),*/
            Divider(color: Colors.grey,),
            ListTile(
              leading: Icon(IconlyBroken.profile,color: defultColor,),
              title: Text("Profile",style: TextStyle(color: defultColor,)),
              onTap: (){
               // Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfilePatient()));
                DatabaseService(
                    uid: FirebaseAuth
                        .instance.currentUser!.uid).getUserInfo(FirebaseAuth.instance.currentUser!.uid).forEach((element) {
                  var x=element.docs[0];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePatient(
                                id: FirebaseAuth.instance.currentUser!.uid, spizlezedName:x['name'], spizlezedImage: x['myImage'],
                                spizlezedAge: x['age'], spizlezedGender: x['gender'], spizlezedCv: x['myCv'], spizlezedPhone: x['phone'], spizlezedWidght: x['weight'], spizlezedHeight: x['height'], diseases: x['diseases'],


                              )));
                });
              },
            ),
            ListTile(
              leading: Icon(IconlyBroken.editSquare ,color:defultColor),
              title: Text("Edit profile",style: TextStyle(color: defultColor)),
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder:(context)=>EditProfilePatien()));
                DatabaseService(
                    uid: FirebaseAuth
                        .instance.currentUser!.uid).getUserInfo(FirebaseAuth.instance.currentUser!.uid).forEach((element) {
                  var x=element.docs[0];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditProfilePatien(
                                id: FirebaseAuth.instance.currentUser!.uid, spizlezedName:x['name'], spizlezedImage: x['myImage'],
                                spizlezedAge: x['age'], spizlezedGender: x['gender'], spizlezedCv: x['myCv'], spizlezedPhone: x['phone'], spizlezedWidght: x['weight'], spizlezedHeight: x['height'], spizlezeddiseases: x['diseases'],myCover: x['myCover']


                              )));
                });
              },
            ),
           /* ListTile(
              leading: Icon(Icons.payment_outlined,color: defultColor),
              title: Text("online payment",style: TextStyle(color: defultColor)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>Nutritionist_pay_screen()));
              },
            ),*/
            ListTile(
              leading: Icon(IconlyBroken.setting,color: defultColor),
              title: Text("Sign Out",style: TextStyle(color: defultColor)),
              onTap: (){
               // Navigator.push(context, MaterialPageRoute(builder:(context)=>SettingPatien()));
                Diohelper.SaveData(
                    key: 'Creatpatient', value: false)
                    .then((value) {
                  if (value) {
                    _auth.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginScreenHeath()),
                            (route) => false);
                  }
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,color: defultColor),
              title: Text("Exit",style: TextStyle(color: defultColor)),
              onTap: (){
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
            ),



          ],
        ),
      ),
    );
  }


}
