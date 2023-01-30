
import 'package:flutter/material.dart';
import 'package:hea_apps/Icons/icons.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

import '../../Shared/Networkes/Logical/Diohelper.dart';
import '../../services/auth.dart';
import '../Login_heath/LoginScreen_heath.dart';


class SettingPatien extends StatefulWidget {
  @override
  State<SettingPatien> createState() => _SettingPatienState();
}

class _SettingPatienState extends State<SettingPatien> {
var Emailcontroller=TextEditingController();

var Passwordcontroller=TextEditingController();
final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor),)),
        title: Text("Setting ",style: TextStyle(color: defultColor,fontStyle: FontStyle.italic),),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: Emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Color(0xff57646C),
                      ),
                      hintText: 'Please enter a E-mail...',
                      hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Color(0xff57646C),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xffF1F4F8),
                      contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: Theme.of(context).textTheme.bodyText1,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "You must enter your email ";
                      }
                    },

                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                   // obscureText: cubit.IsShowEye,
                    controller: Passwordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                     /* suffixIcon:IconButton(icon:Icon(cubit.Icon,color: Colors.grey,),onPressed:(){
                        cubit.RegisterSpeShowVisiblePassword();
                        ;},),*/
                      labelText: 'Password',
                      labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Color(0xff57646C),
                      ),
                      hintText: 'Please enter Password...',
                      hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Color(0xff57646C),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Color(0xffF1F4F8),
                      contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                    ),
                    style: Theme.of(context).textTheme.bodyText1,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "You must enter your Password ";
                      }
                    },

                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.teal),
                          borderRadius: BorderRadius.circular(26.0),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashColor: Colors.teal,
                          onPressed: (){},
                          icon: Icon(
                            IconlyBroken.location,
                            color: Colors.teal,
                            size: 28.0,
                          ),

                        ),
                      ),
                      SizedBox(width: 6.0,),
                      Text("Send your location ",style:Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Color(0xff57646C),
                      ), ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {

                          },
                          child: Text(
                            'change',
                            style: TextStyle(
                              color: defultColor,
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {

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
                            });

                          },
                          child: Text(
                            'sign out',
                            style: TextStyle(
                              color: defultColor,
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
      ),
    );
  }
}
