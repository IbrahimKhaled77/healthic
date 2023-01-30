import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Layout/Health_Layout/health_patien_Layout_Screen.dart';
import 'package:hea_apps/Modeules/CreatProfile_patien/CubitCreatprofile/Cubita.dart';
import 'package:hea_apps/Modeules/CreatProfile_patien/CubitCreatprofile/statesa.dart';
import 'package:hea_apps/Modeules/Edit_profile_patien/Edit_Profile_patien_screen.dart';
import 'package:hea_apps/Modeules/Location/Location_Screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../services/auth.dart';




class Creatprofilepatien extends StatefulWidget {

  const Creatprofilepatien(
      {Key? key, required this.name, required this.email, required this.pass,required this.latLng})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String name;
  final String email;
  final String pass;
  final String latLng;


  @override
  State<Creatprofilepatien> createState() => _CreatprofilepatienState();
}
enum Gender { Male, Female, Undisclosed }

Gender? _gender = Gender.Male;

enum IsClinc { isTrue, isFalse }

IsClinc _isClinc = IsClinc.isTrue;
firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

File? _photo;
final ImagePicker _picker = ImagePicker();
String myImage = "";

class _CreatprofilepatienState extends State<Creatprofilepatien> {
  final _formKey = GlobalKey<FormState>();
  String age = '';
  String address = '';
  String phone = '';
  String myheight='';
  String myWidth="";
  String diseases='';
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key:_formKey ,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.0,),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 57.0,
                        //  backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              myImage ==""? 'https://cdn1.iconfinder.com/data/icons/user-interface-82/100/ui_user_interface_ux-43-512.png':myImage),
                          radius: 59.0,
                          backgroundColor: Colors.white,

                        ),
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      'Upload a photo for us to easily identify you.',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff57646C),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /*  Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Container(
                                    width: 175.0,
                                    child: TextFormField(

                                      //cursorColor: Colors.black26,
                                      controller: fisrtNamecontroller,
                                      onFieldSubmitted: (value){
                                        print(fisrtNamecontroller.text);
                                      },
                                      /*  onChanged: (value){
                                          print(Emailcontroller.text);
                                        },*/
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return "You must enter your FristName " ;
                                        }

                                      },
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: "FristName",
                                        labelStyle: TextStyle( fontStyle:FontStyle.italic,),
                                       // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                      /*  border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(20.0) ,
                                          borderSide: BorderSide(

                                            color: Colors.red,
                                          ),
                                        ),*/

                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.0,),
                                SizedBox(
                                    width: 120.0,
                                  child: Container(
                                    width: 150.0,
                                    child: TextFormField(

                                      //cursorColor: Colors.black26,
                                      controller: LastNamecontroller,
                                      onFieldSubmitted: (value){
                                        print(LastNamecontroller.text);
                                      },
                                      /*  onChanged: (value){
                                          print(Emailcontroller.text);
                                        },*/
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return "You must enter your LastName " ;
                                        }

                                      },
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: "LastName",
                                        labelStyle: TextStyle( fontStyle:FontStyle.italic,),
                                       // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                      /*  border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(20.0) ,
                                          borderSide: BorderSide(

                                            color: Colors.red,
                                          ),
                                        ),*/

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),*/
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType:TextInputType.number ,
                          decoration: InputDecoration(
                            labelText: 'Your Age',
                            labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'i.e.34',
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
                              return "You must enter your Age ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => age = val);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(

                          keyboardType:TextInputType.streetAddress ,
                          decoration: InputDecoration(
                            labelText: 'Your Address',
                            labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'Please enter Address...',
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
                              return "You must enter your Address ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => address = val);
                          },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(

                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone',
                            labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'Please enter Phone...',
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
                              return "You must enter your Phone ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => phone = val);
                          },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'weight',
                            labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'Please enter weight...',
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
                              return "You must enter your weight ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => myWidth = val);
                          },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'height',
                            labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'Please enter height...',
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
                              return "You must enter your height ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => myheight = val);
                          },

                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'diseases',
                            labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'i.e.disbestes,stress...',
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
                              return "You must enter your diseases ";
                            }
                          },
                          onChanged: (val) {
                            setState(() => diseases = val);
                          },


                        ),
                      ),
                      SizedBox(height: 6.0,),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(

                          children: [
                            Align(
                              //  alignment: AlignmentDirectional.topStart,
                              child: Text(
                                'Your Birth Sex',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(color:Color(0xff57646C), ),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width:4 ,),
                            Radio(
                              value: Gender.Male,
                              groupValue: _gender,
                              onChanged: (dynamic value) {
                                //CubitE.ChangeRaiosCreatprofile(value: value);
                                setState(() {
                                  _gender = value;
                                });
                              },
                              activeColor: Colors.teal,
                              toggleable: false,

                            ),
                            Text("Male",style: TextStyle(color: _gender =='Male'?Colors.teal:null ),),
                            Radio(
                              value: Gender.Female,
                              groupValue: _gender,
                              onChanged: (dynamic value) {
                                //CubitE.ChangeRaiosCreatprofile(value: value);
                                setState(() {
                                  _gender = value;
                                });
                              },
                              activeColor: Colors.teal,
                              focusColor:Colors.teal ,
                              toggleable: false,

                            ),
                            Text("Female",style: TextStyle(color: _gender =='Female'?Colors.teal:null ),),
                            Radio(
                              value: Gender.Undisclosed,
                              groupValue: _gender,
                              onChanged: (dynamic value) {
                                //CubitE.ChangeRaiosCreatprofile(value: value);
                                setState(() {
                                  _gender = value;
                                });
                              },
                              activeColor: Colors.teal,
                              toggleable: false,

                            ),
                            Text("Undisclosed",style: TextStyle(color: _gender=='Undisclosed'?Colors.teal:null ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
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
                                onPressed: (){
                                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LocationScreen(name: widget.name, email: widget.email, pass: widget.pass,)), (route) => false);

                                },
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
                      SizedBox(height: 13.0,),

                      /* Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              /*  Container(
                                  width: 110.0,
                                  child: TextFormField(

                                    //cursorColor: Colors.black26,
                                    controller: weightcontroller,
                                    onFieldSubmitted: (value){
                                      print(weightcontroller.text);
                                    },
                                    /*  onChanged: (value){
                                        print(Emailcontroller.text);
                                      },*/
                                    validator: (String? value){
                                      if(value!.isEmpty){
                                        return "You must enter weigh " ;
                                      }

                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: "Weigh",
                                      labelStyle: TextStyle( fontStyle:FontStyle.italic,),
                                      //label: Text("month",textAlign: TextAlign.center,),
                                      // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                     /* border: OutlineInputBorder(
                                        borderRadius:BorderRadius.circular(20.0) ,
                                        borderSide: BorderSide(

                                          color: Colors.red,
                                        ),
                                      ),*/

                                    ),
                                  ),
                                ),*/
                                //SizedBox(width: 10.0,),
                                /*Container(
                                  width: 110.0,
                                  child: TextFormField(

                                    //cursorColor: Colors.black26,
                                    controller: heightcontroller,
                                    onFieldSubmitted: (value){
                                      print(heightcontroller.text);
                                    },
                                    /*  onChanged: (value){
                                        print(Emailcontroller.text);
                                      },*/
                                    validator: (String? value){
                                      if(value!.isEmpty){
                                        return "You must enter height " ;
                                      }

                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: "Height",
                                      labelStyle: TextStyle( fontStyle:FontStyle.italic,),
                                      //label: Text("month",textAlign: TextAlign.center,),
                                      // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                      /* border: OutlineInputBorder(
                                        borderRadius:BorderRadius.circular(20.0) ,
                                        borderSide: BorderSide(

                                          color: Colors.red,
                                        ),
                                      ),*/

                                    ),
                                  ),
                                ),*/
                               // SizedBox(width: 10.0,),
                                SizedBox(
                                  width: 120.0,
                                  child: Container(
                                    width: 110.0,
                                    child: TextFormField(

                                      //cursorColor: Colors.black26,
                                      controller: weightcontroller,
                                      onFieldSubmitted: (value){
                                        print(weightcontroller.text);
                                      },
                                      /*  onChanged: (value){
                                          print(Emailcontroller.text);
                                        },*/
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return "You must enter weigh " ;
                                        }

                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: "Weigh",
                                        labelStyle: TextStyle( fontStyle:FontStyle.italic,),
                                        //label: Text("month",textAlign: TextAlign.center,),
                                        // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                        /* border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(20.0) ,
                                          borderSide: BorderSide(

                                            color: Colors.red,
                                          ),
                                        ),*/

                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width:10.0 ,),
                                SizedBox(
                                  width: 120.0,
                                  child: Container(
                                    width: 110.0,
                                    child: TextFormField(

                                      //cursorColor: Colors.black26,
                                      controller: heightcontroller,
                                      onFieldSubmitted: (value){
                                        print(heightcontroller.text);
                                      },
                                      /*  onChanged: (value){
                                          print(Emailcontroller.text);
                                        },*/
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return "You must enter height " ;
                                        }

                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: "Height",
                                        labelStyle: TextStyle( fontStyle:FontStyle.italic,),
                                        //label: Text("month",textAlign: TextAlign.center,),
                                        // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                        /* border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(20.0) ,
                                          borderSide: BorderSide(

                                            color: Colors.red,
                                          ),
                                        ),*/

                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),*/

                      SizedBox(height: 20.0,),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: defultColor,
                          ),
                          child: MaterialButton(
                            onPressed:() async{

                            //  LatLng(31.868345128220906, 35.92034328728914)
                              var newgg=widget.latLng;
                              String y="";
                              y= newgg.replaceAll('LatLng(', '');
                              y= y.replaceAll(')','');
                              print(y);
                              if(myImage == ""){
                                showTost("add image please");


                              }else{
                                if (_formKey.currentState!.validate()) {
                                  dynamic result = await _auth.registerWithEmailAndPassword(
                                      widget.name,
                                      widget.email, widget.pass,"patint",age,address,phone,_gender.toString().split('.').last,_isClinc.toString().split('.').last,"",myImage,"",myWidth,myheight,diseases,"true","",y);
                                  if (result == null) {
                                    setState(() {
                                      //  error = 'Please supply a valid email';
                                      showTost("The email address is already in use by another account");

                                    });
                                  }else{
                                    // login>home
                                    Diohelper.SaveData(key: 'UserNmae', value: widget.name);
                                    Diohelper.SaveData(key: 'UserImage', value: myImage);
                                    Diohelper.SaveData(key: 'Usertype', value: "patint");
                                    Diohelper.SaveData(key: 'myCover', value: "");

                                    Diohelper.SaveData(key: 'Creatpatient', value: true).then((value) {
                                      if(value){
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>healthLayout_patien()), (route) => false);
                                        showTost("login success");

                                      }
                                    });
                                  }


                                }
                              }



                            },

                            child: Text(
                              "Create Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),

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
  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      await ref.putFile(_photo!);
      var downloadURL = await storage.ref("files/$fileName").getDownloadURL();
// Create/Update firesotre document


      setState(() {
        myImage = downloadURL.toString();
        print(downloadURL.toString());
      });


    } catch (e) {
      print('error occured');
    }
  }
}
class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height/2);
    path.cubicTo(size.width/4, 3*(size.height/2), 3*(size.width/4), size.height/2, size.width, size.height*0.9);
    /*path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);*/
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget colorbulid(context)=>ClipPath(
  // ignore: sort_child_properties_last
  child: Container(
    width: MediaQuery.of(context).size.width,
    height: 150,
    color: defultColor,
  ),
  clipper: CustomClipPath(),
);


/*Diohelper.SaveData(key: 'Creatpatient', value: true).then((value) {
if(value){
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>healthLayout_patien()), (route) => false);
}
});*/

/*    Container(
              width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color:  Colors.teal.shade200,
              ),
              child: MaterialButton(
                onPressed: (){

                },
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),

                ),
              ),
            ),*/


/* Row(
                             // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: Container(
                                    width: 120.0,
                                    child: TextFormField(
                                   /*   onTap: (){
                                        showDatePicker(
                                          context: context,
                                          initialDate:DateTime.now() ,
                                          firstDate: DateTime(1932),
                                          lastDate: DateTime(2023,1,2),
                                        ).then((value) {
                                          yearscontroller.text=DateFormat.yMMMd().format(value!);
                                        });

                                      },*/
                                      //cursorColor: Colors.black26,
                                      controller: yearscontroller,
                                      onFieldSubmitted: (value){
                                        print(yearscontroller.text);
                                      },
                                      /*  onChanged: (value){
                                          print(Emailcontroller.text);
                                        },*/
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return "You must enter your Age " ;
                                        }

                                      },
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        labelText: "Age",
                                       // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                       /* border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(20.0) ,
                                          borderSide: BorderSide(

                                            color: Colors.red,
                                          ),
                                        ),*/

                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width:10.0 ,),
                                SizedBox(
                                  width: 120.0,
                                  child:Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        labelText: "--Gender--",

                                      ),
                                      validator: (String? v){
                                        if(v!.isEmpty){
                                          return "You must enter your Gender ";
                                        }

                                      },

                                      alignment: AlignmentDirectional.center,
                                   //   value:SelectedItem ,
                                      items: itemsList.map((items) =>DropdownMenuItem(
                                        child:Text(items,style: TextStyle(fontSize: 18.0,fontStyle: FontStyle.italic),) ,
                                      value:items ,
                                      )).toList(),
                                      onChanged: (items)=>setState(()=>SelectedItem=items),

                                    ),
                                  )
                                ),
                                /*Container(
                                  width: 110.0,
                                  child: TextFormField(

                                    //cursorColor: Colors.black26,
                                    controller: mothcontroller,
                                    onFieldSubmitted: (value){
                                      print(mothcontroller.text);
                                    },
                                    /*  onChanged: (value){
                                        print(Emailcontroller.text);
                                      },*/
                                    validator: (String? value){
                                      if(value!.isEmpty){
                                        return "You must enter Month " ;
                                      }

                                    },
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      labelText: "month",
                                      //label: Text("month",textAlign: TextAlign.center,),
                                      // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                     /* border: OutlineInputBorder(
                                        borderRadius:BorderRadius.circular(20.0) ,
                                        borderSide: BorderSide(

                                          color: Colors.red,
                                        ),
                                      ),*/

                                    ),
                                  ),
                                ),*/
                              //  SizedBox(width:6.0 ,),
                                /*Expanded(
                                  child: Container(
                                    width: 100.0,
                                    child: TextFormField(

                                      //cursorColor: Colors.black26,
                                      controller: daycontroller,
                                      onFieldSubmitted: (value){
                                        print(daycontroller.text);
                                      },
                                      /*  onChanged: (value){
                                          print(Emailcontroller.text);
                                        },*/
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return "You must enter day " ;
                                        }

                                      },
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        labelText: "day",
                                        //label: Text("month",textAlign: TextAlign.center,),
                                        // prefixIcon:Icon(Icons.person,color: Colors.teal.shade200,),
                                        /*border: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(20.0) ,
                                          borderSide: BorderSide(

                                            color: Colors.red,
                                          ),
                                        ),*/

                                      ),
                                    ),
                                  ),
                                ),*/
                              ],
                            ),*/