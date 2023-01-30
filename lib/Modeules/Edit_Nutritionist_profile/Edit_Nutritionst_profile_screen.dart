import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../Shared/Networkes/Logical/Diohelper.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../CreatProfile_Specialized/Creatprofile_Screen_Specialized.dart';

class EditProfileNutritionst extends StatefulWidget {
  const EditProfileNutritionst(
      {Key? key,
      required this.id,
      required this.spizlezedName,
      required this.spizlezedImage,
      required this.spizlezedAge,
      required this.spizlezedGender,
      required this.spizlezedCv,
        required this.spizlezedPhone,required this.myCover
      })
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String id;
  final String spizlezedName;
  final String spizlezedImage;
  final String spizlezedAge;
  final String spizlezedGender;
  final String spizlezedCv;
  final String spizlezedPhone;
  final String myCover;

  @override
  State<EditProfileNutritionst> createState() => _EditProfileNutritionstState();
}

enum IsClinc { isTrue, isFalse }

IsClinc _isClinc = IsClinc.isTrue;
firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

class _EditProfileNutritionstState extends State<EditProfileNutritionst> {
  final _formKey = GlobalKey<FormState>();
  String age = '';
  String name = '';
  String phone = '';
  final AuthService _auth = AuthService();

  Text imagecvred = Text(
    "(Image)!",
    style: TextStyle(color: Colors.teal),
  );
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  String myImage = "";
  String myCover = "";
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
          " Edit Profile ",
          style: TextStyle(color: defultColor, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                                    myCover == ""?'https://tse2.mm.bing.net/th?id=OIP.At9CpPJanT2mDg-DAdCJQwHaE8&pid=Api&P=0}':myCover
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
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Edit Your Name',
                      labelStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
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
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Edit Your Age',
                      labelStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
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
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
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
                      labelStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
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
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
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
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.teal),
                          borderRadius: BorderRadius.circular(26.0),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashColor: Colors.teal,
                          onPressed: () {},
                          icon: Icon(
                            IconlyBroken.location,
                            color: Colors.teal,
                            size: 28.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "Send your location or cilinic location",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.teal),
                          borderRadius: BorderRadius.circular(26.0),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashColor: Colors.teal,
                          onPressed: () {},
                          icon: Icon(
                            IconlyBroken.image2,
                            color: Colors.teal,
                            size: 28.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "Send your CV  as an ",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                      ),
                      Text(
                        "(Image)!",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.teal,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      Align(
                        //  alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Do you have a clinic',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color(0xff57646C),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Radio(
                        value: 'true',
                        groupValue: 'true',
                        onChanged: (dynamic value) {},
                        activeColor: Colors.teal,
                        toggleable: false,
                      ),
                      Text(
                        "true",
                        style: TextStyle(color: Colors.teal),
                      ),
                      Radio(
                        value: 'false',
                        groupValue: 'false',
                        onChanged: (dynamic value) {},
                        activeColor: Colors.teal,
                        focusColor: Colors.teal,
                        toggleable: false,
                      ),
                      Text(
                        "false",
                        style: TextStyle(color: Colors.teal),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {

                            if(myImage != ""){
                              DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                                  .updateUserImage(myImage);
                            }else{
                              showTost("add image");
                            }


                          },
                          child: Text(
                            'Uptodate photo',
                            style: TextStyle(
                              color: defultColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
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
                              DatabaseService(
                                  uid: FirebaseAuth.instance.currentUser!.uid)
                                  .updateUserInfo(name, age, phone).then((value) {
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
