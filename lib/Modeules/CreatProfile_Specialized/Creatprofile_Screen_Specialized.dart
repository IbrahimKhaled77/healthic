import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hea_apps/Layout/Health_Layout/health_Specialized_Layout_Screen.dart';
import 'package:hea_apps/Modeules/CreatProfile_Specialized/CubitCreatprofile/Cubit.dart';
import 'package:hea_apps/Modeules/CreatProfile_Specialized/CubitCreatprofile/states.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path/path.dart';

import '../../services/auth.dart';

class CreatprofileSpecialized extends StatefulWidget {
  const CreatprofileSpecialized(
      {Key? key, required this.name, required this.email, required this.pass,required this.latLng})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String name;
  final String email;
  final String pass;
  final String latLng;

  @override
  State<CreatprofileSpecialized> createState() =>
      _CreatprofileSpecializedState();
}

enum Gender { Male, Female, Undisclosed }

Gender? _gender = Gender.Male;

enum IsClinc { isTrue, isFalse }

IsClinc _isClinc = IsClinc.isTrue;
firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

File? _photo;
final ImagePicker _picker = ImagePicker();
String myCv = "";
String myImage="";

class _CreatprofileSpecializedState extends State<CreatprofileSpecialized> {
  final _formKey = GlobalKey<FormState>();
  String age = '';
  String address = '';
  String phone = '';
  final AuthService _auth = AuthService();

  Text imagecvred = Text(
    "(Image)!",
    style: TextStyle(color: Colors.teal),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*  Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          colorbulid(context),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 57.0,
                                child: CircleAvatar(
                                  backgroundImage: ((cubitImage == null)
                                      ? NetworkImage(
                                      "https://tse2.mm.bing.net/th?id=OIP.4HMFidvlLTdFNhEUMANXXgHaJQ&pid=Api&P=0")
                                      : FileImage(cubitImage) as ImageProvider),
                                  radius: 56.0,

                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  CubitE.getImageProfile();
                                },
                                icon: CircleAvatar(
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 19.0,
                                    )),

                              ),
                            ],
                          ),

                        ],
                      ),*/
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showPicker(context,"myImage");
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
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Upload a photo for us to easily identify you.',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff57646C),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 15.0,),
                      /*Row(
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
                                SizedBox(width: 6.0,),
                                SizedBox(
                                    width: 120.0,
                                    child:Padding(
                                      padding: const EdgeInsets.only(bottom: 5.0),
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
                              ],
                            ),*/
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Your Age',
                            labelStyle:
                            Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'i.e.34',
                            hintStyle:
                            Theme.of(context).textTheme.bodyText2!.copyWith(
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

                      //  SizedBox(height: 15.0,),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            labelText: 'Your Address',
                            labelStyle:
                            Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'Please enter Address...',
                            hintStyle:
                            Theme.of(context).textTheme.bodyText2!.copyWith(
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
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
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
                            labelStyle:
                            Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color(0xff57646C),
                            ),
                            hintText: 'Please enter Phone...',
                            hintStyle:
                            Theme.of(context).textTheme.bodyText2!.copyWith(
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
                        height: 6.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Align(
                              //  alignment: AlignmentDirectional.topStart,
                              child: Text(
                                'Your Birth Sex',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
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
                            Text(
                              "Male",
                              style: TextStyle(
                                  color:
                                  _gender == 'Male' ? Colors.teal : null),
                            ),
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
                              focusColor: Colors.teal,
                              toggleable: false,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  color:
                                  _gender == 'Female' ? Colors.teal : null),
                            ),
                            Radio(
                              value: Gender.Undisclosed,
                              groupValue: _gender,
                              onChanged: (dynamic value) {
                                // CubitE.ChangeRaiosCreatprofile(value: value);
                                setState(() {
                                  _gender = value;
                                });
                              },
                              activeColor: Colors.teal,
                              toggleable: false,
                            ),
                            Text(
                              "Undisclosed",
                              style: TextStyle(
                                  color: _gender == 'Undisclosed'
                                      ? Colors.teal
                                      : null),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Align(
                              //  alignment: AlignmentDirectional.topStart,
                              child: Text(
                                'Do you have a clinic',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
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
                              value: IsClinc.isTrue,
                              groupValue: _isClinc,
                              onChanged: (dynamic value) {
                                //CubitE.ChangeRaiosCreatprofile(value: value);
                                setState(() {
                                  _isClinc = value;
                                });
                              },
                              activeColor: Colors.teal,
                              toggleable: false,
                            ),
                            Text(
                              "true",
                              style: TextStyle(
                                  color: _isClinc == 'isTrue'
                                      ? Colors.teal
                                      : null),
                            ),
                            Radio(
                              value: IsClinc.isFalse,
                              groupValue: _isClinc,
                              onChanged: (dynamic value) {
                                //CubitE.ChangeRaiosCreatprofile(value: value);
                                setState(() {
                                  _isClinc = value;
                                });
                              },
                              activeColor: Colors.teal,
                              focusColor: Colors.teal,
                              toggleable: false,
                            ),
                            Text(
                              "false",
                              style: TextStyle(
                                  color: _isClinc == 'isFalse'
                                      ? Colors.teal
                                      : null),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 1, color: Colors.teal),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                color: Color(0xff57646C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 1, color: Colors.teal),
                                borderRadius: BorderRadius.circular(26.0),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                splashColor: Colors.teal,
                                onPressed: () {
                                  // CubitE.getImageProfileCV();
                                  showPicker(context,"myCv");
                                },
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                color: Color(0xff57646C),
                              ),
                            ),
                            Text(
                              "(Image)!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(
                                  width: 120.0,
                                  child: Container(
                                    width: 110.0,
                                    child: TextFormField(

                                      //cursorColor: Colors.black26,
                                      controller: Addresscontroller,
                                      onFieldSubmitted: (value){
                                        print(Addresscontroller.text);
                                      },
                                      /*  onChanged: (value){
                                            print(Emailcontroller.text);
                                          },*/
                                      validator: (String? value){
                                        if(value!.isEmpty){
                                          return "You must enter address " ;
                                        }

                                      },
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                        labelText: "address",
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
                                SizedBox(width: 6.0,),
                                Container(
                                  height: 70.0,
                                  width: 110.0,
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: TextButton(
                                    onPressed: (){
                                      CubitE.getImageProfile();
                                    },
                                    child: Text(
                                      "Send CV",
                                      style: TextStyle(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.w500,
                                        color: defultColor,

                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                  ),
                                ),
                              ],
                            ),*/
                      SizedBox(
                        height: 40.0,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: defultColor,
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              var newgg=widget.latLng;
                              String y="";
                              y= newgg.replaceAll('LatLng(', '');
                              y= y.replaceAll(')','');
                              print(y);
                              if (myCv == ""){
                                showTost("add cv please");
                              }else  if (myImage == ""){
                                showTost("add image please");
                              }
                              else if (_formKey.currentState!.validate() ) {

                                dynamic result = await _auth.registerWithEmailAndPassword(
                                    widget.name,
                                    widget.email, widget.pass,"specialized",age,address,phone,_gender.toString().split('.').last,_isClinc.toString().split('.').last,"",myImage,myCv,"","","","false","",y);
                                if (result == null) {
                                  setState(() {
                                    //  error = 'Please supply a valid email';
                                    showTost("The email address is already in use by another account");
                                  });
                                }else{
                                  // login>home
                                  Diohelper.SaveData(key: 'UserNmae', value: widget.name);
                                  Diohelper.SaveData(key: 'UserImage', value: myImage);
                                  Diohelper.SaveData(key: 'Usertype', value: "specialized");
                                  Diohelper.SaveData(
                                      key: 'creatSpecialized', value: true)
                                      .then((value) {
                                    if (value) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  healthLayout_Specialized()),
                                              (route) => false);
                                      showTost("login success");
                                    }
                                  });
                                }


                              }
                            },
                            child: Text(
                              "Create Specialized",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                fontStyle: FontStyle.normal,
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
  void showPicker(context,String type) {
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
        if(type == "myCv"){
          myCv = downloadURL!.toString();
        }
        else if(type == "myImage"){
          myImage = downloadURL!.toString();
        }

        print(downloadURL!.toString());
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
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);
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

Widget colorbulid(context) => ClipPath(
  // ignore: sort_child_properties_last
  child: Container(
    width: MediaQuery.of(context).size.width,
    height: 150,
    color: defultColor,
  ),
  clipper: CustomClipPath(),
);