import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hea_apps/Icons/icons.dart';
import 'package:hea_apps/Modeules/Accept_patient_by_Nutritionst/Accept_patient_by_Nutritions_screen.dart';
import 'package:hea_apps/Modeules/Chat_Nutritionst/Chat_Nutritionst_screen.dart';
import 'package:hea_apps/Modeules/Do_not_disturb/Do_not_disturb_screen.dart';
import 'package:hea_apps/Modeules/Edit_Nutritionist_profile/Edit_Nutritionst_profile_screen.dart';
import 'package:hea_apps/Modeules/Manage%20Diet%20plan/Patients%20_who_pay/Patients_who_pay_Screen.dart';
import 'package:hea_apps/Modeules/Manage_patient_bynutritionist/Manage_nutritionist_screen.dart';
import 'package:hea_apps/Modeules/Manage_picture_Nutritionist_by_patient/Manage_picture_Nutritionist_by_patien_screen.dart';
import 'package:hea_apps/Modeules/Setting_nutritionist/Setting_nutritioist_screen.dart';
import 'package:hea_apps/Modeules/profile_nutritionist/Profile_nutritionist_screen.dart';
import 'package:hea_apps/Modeules/view-booked-appointment/View_booked_appointment_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'dart:io' show Platform, exit;

import '../../services/auth.dart';
import '../../services/database.dart';
import '../Login_heath/LoginScreen_heath.dart';

class NavBar_Specialized extends StatelessWidget {
  List<ListTile> a = [];
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    print("myimage" + Diohelper.GetData(key: "UserImage"));
    return Container(
      // color: Colors.black,
      child: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(Diohelper.GetData(key: "UserNmae")),
              accountEmail:
                  Text(FirebaseAuth.instance.currentUser!.email.toString()),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    Diohelper.GetData(key: "UserImage") != null
                        ? Diohelper.GetData(key: "UserImage")
                        : "https://firebasestorage.googleapis.com/v0/b/my-health-1ea62.appspot.com/o/files%2Fimage_picker1132874024160098761.jpg?alt=media&token=d0908e96-528c-49c2-ac57-4351f82cd30c",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assert/image/Wood-3-1024x576.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /*ListTile(
              leading: Icon(Icons.person_add_alt_1_outlined,color:defultColor,),
              title: Text("patient requests",style: TextStyle(color: defultColor ,),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Accept_Patient()));
              },
            ),*/
            ListTile(
              leading: Icon(
                Icons.manage_accounts_outlined,
                color: defultColor,
              ),
              title: Text("manage patient",
                  style: TextStyle(
                    color: defultColor,
                  )),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Manage_Nutritionist_by_patient_screen()))
              },
            ),
            ListTile(
              leading: Icon(
                IconlyBroken.chat,
                color: defultColor,
              ),
              title: Text("Chat with patient",
                  style: TextStyle(
                    color: defultColor,
                  )),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MessChatNutritions()))
              },
            ),
            ListTile(
              leading: Icon(
                IconlyBroken.camera,
                color: defultColor,
              ),
              title: Text("A picture of the patient",
                  style: TextStyle(
                    color: defultColor,
                  )),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Manage_picture()))
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                IconlyBroken.bookmark,
                color: defultColor,
              ),
              title: Text("View book appointment",
                  style: TextStyle(
                    color: defultColor,
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => view_booked_appoiemnts(
                              myday: "sun",
                            )));
              },
            ),
            ListTile(
              leading: Icon(
                IconlyBroken.calendar,
                color: defultColor,
              ),
              title: Text("Manage diet plan",
                  style: TextStyle(
                    color: defultColor,
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Patients_who_pay_Screen()));
              },
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(IconlyBroken.profile, color: defultColor),
              title: Text("profile", style: TextStyle(color: defultColor)),
              onTap: () {
                DatabaseService(
                    uid: FirebaseAuth
                        .instance.currentUser!.uid).getUserInfo(FirebaseAuth.instance.currentUser!.uid).forEach((element) {
                  var x=element.docs[0];
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) =>
                               ProfileNutritionist(
                             id: FirebaseAuth.instance.currentUser!.uid, spizlezedName:x['name'], spizlezedImage: x['myImage'],
                             spizlezedAge: x['age'], spizlezedGender: x['gender'], spizlezedCv: x['myCv'], spizlezedPhone: x['phone'],cansearsh: x['caneSearch'],myCover: x['myCover'],isClinc: x['clinic'], latlang: x['latlang'],


                           )));
                });



              },
            ),
            ListTile(
              leading: Icon(IconlyBroken.editSquare, color: defultColor),
              title: Text("Edit profile", style: TextStyle(color: defultColor)),
              onTap: () {
                DatabaseService(
                    uid: FirebaseAuth
                        .instance.currentUser!.uid).getUserInfo(FirebaseAuth.instance.currentUser!.uid).forEach((element) {
                  var x=element.docs[0];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditProfileNutritionst(
                                id: FirebaseAuth.instance.currentUser!.uid, spizlezedName:x['name'], spizlezedImage: x['myImage'],
                                spizlezedAge: x['age'], spizlezedGender: x['gender'], spizlezedCv: x['myCv'], spizlezedPhone: x['phone'],myCover: x['myCover'],


                              )));
                });
              },
            ),
           /* ListTile(
              leading:
                  Icon(Icons.notifications_off_outlined, color: defultColor),
              title:
                  Text("Do not disturb", style: TextStyle(color: defultColor)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => multiSwitch()));
              },
            ),*/
            ListTile(
              leading: Icon(IconlyBroken.setting, color: defultColor),
              title: Text("SignOut", style: TextStyle(color: defultColor)),
              onTap: () {

                Diohelper.SaveData(
                    key: 'creatSpecialized', value: false)
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
               /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingNutritionst()));*/
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: defultColor),
              title: Text("Exit", style: TextStyle(color: defultColor)),
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
