import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Modeules/Creat_new_post/Creat_new_post_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../services/auth.dart';
import '../../services/database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class EditProfilePatien extends StatefulWidget {
  const EditProfilePatien(
      {Key? key, required this.id,required this.spizlezedName,required this.spizlezedImage,required this.spizlezedAge,
        required this.spizlezedGender, required this.spizlezedCv,required this.spizlezedPhone,
        required this.spizlezedWidght,required this.spizlezedHeight,required this.spizlezeddiseases,required this.myCover })
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String id;
  final String spizlezedName;
  final String spizlezedImage;
  final String spizlezedAge;
  final String spizlezedGender;
  final String spizlezedCv;
  final String spizlezedPhone;
  final String spizlezedWidght;
  final String spizlezedHeight;
  final String spizlezeddiseases;
  final String myCover;

  @override
  State<EditProfilePatien> createState() => _EditProfilePatienState();
}
final _formKey = GlobalKey<FormState>();
String age = '';
String name = '';
String phone = '';
String mywidght = '';
String height = '';
String disess = '';
final AuthService _auth = AuthService();

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

File? _photo;
final ImagePicker _picker = ImagePicker();
String myImage = "";
String myCover = "";

class _EditProfilePatienState extends State<EditProfilePatien> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor),)),
        title: Text(" Edit Profile ",style: TextStyle(color: defultColor,fontStyle: FontStyle.italic),),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 190.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: InkWell(
                        onTap: ()=>{
                          showPicker(context,"myCover")
                        },
                        child: Container(

                          height: 140.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                4.0,
                              ),
                              topRight: Radius.circular(
                                4.0,
                              ),
                            ),
                            image: DecorationImage(

                              image: NetworkImage(
                              widget.myCover == ""?'https://static01.nyt.com/images/2011/01/14/arts/14MOVING-span/MOVING-jumbo.jpg':myCover
                              ),

                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    InkWell(
                      onTap: ()=>{
                      showPicker(context,"myImage")
                      },
                      child: CircleAvatar(

                        radius: 64.0,
                        backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(

                          radius: 60.0,
                          backgroundImage: NetworkImage(
                            widget.spizlezedImage,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  initialValue: widget.spizlezedName,

                  keyboardType:TextInputType.name ,
                  decoration: InputDecoration(
                    labelText: 'Edit Your Name',
                    labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
                    ),
                  /*  hintText: 'Please enter Name  on the application ...',
                    hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(0xff57646C),
                    ),*/
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
                      return "You must enter your Name ";
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
                  initialValue: widget.spizlezedAge,
                  keyboardType:TextInputType.number ,
                  decoration: InputDecoration(
                    labelText: 'Edit Your Age',
                    labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
                    ),
                    /*hintText: 'i.e.34',
                    hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(0xff57646C),
                    ),*/
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
                  initialValue: widget.spizlezedPhone,

                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
                    ),
                   /* hintText: 'Please enter Phone...',
                    hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(0xff57646C),
                    ),*/
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
                  initialValue: widget.spizlezedWidght,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'weight',
                    labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
                    ),
                 /*   hintText: 'Please enter weight...',
                    hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(0xff57646C),
                    ),*/
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
                    setState(() => mywidght = val);
                  },


                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  initialValue: widget.spizlezedHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'height',
                    labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
                    ),
                   /* hintText: 'Please enter height...',
                    hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(0xff57646C),
                    ),*/
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
                    setState(() => height = val);
                  },

                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  initialValue: widget.spizlezeddiseases,

                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'diseases',
                    labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
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
                  onChanged: (val) {
                    setState(() => disess = val);
                  },

                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(myImage != ""){
                              DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                                  .updateUserImage(myImage);
                            }else{
                              showTost("add image");
                            }

                          });


                        },
                        child: Text(
                          'Update Image',
                          style: TextStyle(
                            color: defultColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          if(myCover == ""){
                            showTost("add cover");

                          }else{
                            DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                                .updateCover(myCover);
                          }

                        },
                        child: Text(
                          'Uptodate Cover Photo ',
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
                padding: EdgeInsetsDirectional.fromSTEB(20, 13, 20, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if(name == "" ){
                              name=widget.spizlezedName;
                            }
                            if(age == "" ){
                              age=widget.spizlezedAge;
                            }
                            if(phone == "" ){
                              phone=widget.spizlezedPhone;
                            }
                            if(mywidght == "" ){
                              mywidght=widget.spizlezedWidght;
                            }
                            if(height == "" ){
                              height=widget.spizlezedHeight;
                            }
                            if(disess == "" ){
                              disess=widget.spizlezeddiseases;
                            }
                            DatabaseService(
                                uid: FirebaseAuth.instance.currentUser!.uid)
                                .updatePatintInfo(name, age, phone,mywidght,height,disess).then((value) {
                              showTost("update success");

                            });
                          }
                        },
                        child: Text(
                          'Update',
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
  void showPicker(context,type) {
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
                        imgFromGallery(type);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera(type);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });

  }

  Future imgFromGallery(type) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile(type);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera(type) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile(type);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile(type) async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path!!);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(destination);
      await ref.putFile(_photo!);
      var downloadURL = await storage.ref("files/$fileName").getDownloadURL();
// Create/Update firesotre document


      setState(() {
        if(type == "myImage"){
          myImage = downloadURL!.toString();
        }else if(type == "myCover"){
          myCover = downloadURL!.toString();
          Diohelper.SaveData(
              key: 'myCover', value: myCover);
        }

        print(downloadURL!.toString());
      });


    } catch (e) {
      print('error occured');
    }
  }
}
