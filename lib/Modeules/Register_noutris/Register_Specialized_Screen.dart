import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hea_apps/Layout/Health_Layout/health_Specialized_Layout_Screen.dart';
import 'package:hea_apps/Modeules/CreatProfile_Specialized/Creatprofile_Screen_Specialized.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'package:hea_apps/Shared/Shealt_Compnent/Constants.dart';
import '../../services/auth.dart';
import '../Location/Location_Screen.dart';


class RegisterSpecialized extends StatefulWidget {
  const RegisterSpecialized({Key? key}) : super(key: key);
  @override
  State<RegisterSpecialized> createState() => _RegisterSpecializedState();
}

class _RegisterSpecializedState extends State<RegisterSpecialized> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool _showPassword = true;

  // text field state
  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                Column(
                children: [
                SvgPicture.asset('assert/image/logogApp.svg', height: 100,
                  width: 100,),
                SizedBox(height: 5.0,),
                Text("Healthic", style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),),
                ],
              ),
              SizedBox(height: 17.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Column(
                    children: [
                Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: Theme
                        .of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
                      color: Color(0xff57646C),

                    ),
                    hintText: 'Please enter a valid number...',
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
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
                    contentPadding: EdgeInsetsDirectional.fromSTEB(
                        20, 24, 20, 24),
                  ),
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "You must enter your name ";
                    }else if(value.length<2){
                      return "You must enter more than 2 characters";
                    }
                  },
                  onChanged: (val) {
                    setState(() => name = val);
                  },

                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: Theme
                        .of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
                      color: Color(0xff57646C),
                    ),
                    hintText: 'Please enter a E-mail...',
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
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
                    contentPadding: EdgeInsetsDirectional.fromSTEB(
                        20, 24, 20, 24),
                  ),
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "You must enter your email ";
                    }else if(!value.isValidEmail()) {
                      return  "Check your email";
                    }

                  },
                  onChanged: (val) {
                    setState(() => email = val);
                  },

                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(


                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _showPassword,
                  decoration: InputDecoration(

                    labelText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword ?Icons.visibility_off  : Icons.visibility,
                      ),
                    ),
                    labelStyle: Theme
                        .of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
                      color: Color(0xff57646C),
                    ),
                    hintText: 'Please enter Password...',
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
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
                    contentPadding: EdgeInsetsDirectional.fromSTEB(
                        20, 24, 20, 24),
                  ),
                  style: Theme.of(context).textTheme.bodyText1,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "You must enter your Password ";
                    }
                    else if(value.length < 6  ){
                      return 'Enter a password 6+ chars long';

                    }
                  },
                  onChanged: (val) {
                    setState(() => password = val);
                  },


                ),
              ),
              SizedBox(height: 25.0,),
              Container(
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: defultColor,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Diohelper.SaveData(key: 'RasterSpecialized', value: true).then((value) {
                        if(value){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> creatSpecialized==true ? healthLayout_Specialized():LocationScreen(name: name,email: email,pass: password, type: '2',),), (route) => false);

                        }
                      });
                    }
                  },

                  child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                      ),

                        ),
                      ),
                    ),
            if(specialized!=null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  width: 100.0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: defultColor,),
                        SizedBox(width: 5.0,),
                        Text(
                          "back",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: defultColor,
                          ),
                        ),

                      ],
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
            )
        ,
        )
        ,
        );
      }
    }

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}


/* dynamic result = await _auth.registerWithEmailAndPassword(name,
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                        });
                      }else{
                       // login>home

                      }*/