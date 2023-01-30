import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hea_apps/Modeules/CreatProfile_Specialized/CubitCreatprofile/Cubit.dart';
import 'package:hea_apps/Modeules/CreatProfile_Specialized/CubitCreatprofile/states.dart';
import 'package:hea_apps/Modeules/Management_profilr/Informa_profile/View_CV/CV.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

class Informat_profile extends StatefulWidget {
  const Informat_profile(
      {Key? key, required this.name, required this.email, required this.image,required this.phone,required this.gender,required this.cvimage})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String name;
  final String email;
  final String image;
  final String phone;
  final String gender;
  final String cvimage;
  @override
  State<Informat_profile> createState() => _Informat_profileState();
}

class _Informat_profileState extends State<Informat_profile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatProfileSpecializedcubit,CreatprofileSpecializedstate>(
      listener: (context, state) {},
    builder: (context, state) {
      var cubit = CreatProfileSpecializedcubit.get(context).ImageProfil;
      var CubitE = CreatProfileSpecializedcubit.get(context);
        return  Scaffold(
          /*  appBar: AppBar(
          leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor),)),
          title: Text("Profile ",style: TextStyle(color: defultColor,fontStyle: FontStyle.italic),),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),*/
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    colorbulid(context),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 57.0,
                          child: CircleAvatar(
                            backgroundImage:
                                 NetworkImage(widget.image ==""?
                                'https://tse2.mm.bing.net/th?id=OIP.4HMFidvlLTdFNhEUMANXXgHaJQ&pid=Api&P=0': widget.image)
                                ,
                            radius: 56.0,

                          ),
                        ),

                      ],
                    ),

                  ],
                ),
                SizedBox(height: 15.0,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Name :",style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0, ),),
                            SizedBox(width: 7.0,),
                            Text(widget.name ,style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0,color: Colors.grey), ),
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Text("E-mail :",style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0, ),),
                            SizedBox(width: 7.0,),
                            Text(widget.email ,style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0,color: Colors.grey), ),
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Text("Phone :",style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0, ),),
                            SizedBox(width: 7.0,),
                            Text(widget.phone,style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0,color: Colors.grey), ),
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Text("Gender :",style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0, ),),
                            SizedBox(width: 7.0,),
                            Text("Male" ,style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0,color: Colors.grey), ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
                           color: defultColor,
                         ),
                         child: MaterialButton(
                             onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewCV_Screen(imgCv: widget.cvimage,) ),);
                             },
                              child: Text("View Cv " ,style:  TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,fontSize:20.0,color: Colors.white ),),
                         ),
                       ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Container(
                            width: 100.0,
                            child: TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back ,color: defultColor,),
                                  SizedBox(width: 5.0,),
                                  Text(
                                    "back",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
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
                ),
              ],
            ),
          ),
        );
    },

    );
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
