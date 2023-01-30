
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hea_apps/Modeules/Management_post/Management_post_screen.dart';
import 'package:hea_apps/Modeules/Management_profilr/Management_profilr_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';


class AdimaLayout extends StatefulWidget {


  @override
  State<AdimaLayout> createState() => _AdimaLayoutState();
}
var c=true;
var f=false;

class _AdimaLayoutState extends State<AdimaLayout> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                alignment:AlignmentDirectional.center ,
                children: [
                  colorbulid(context),
                  SvgPicture.asset('assert/image/ibrahim.svg',height: 200,width: 210,)
                ],
              ),
              SizedBox(height: 20.0,),
              Expanded(
                child: Container(
                  width: 300.0,
                  height: 200.0,
                 // padding:const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: defultColor,width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                   // color: c==true ?defultColor: null,
                  ),
                    child: MaterialButton(
                      splashColor: defultColor,
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ManagementPost()) );


                    },
                    child: Text('Management Post',style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold,color: defultColor,fontStyle: FontStyle.italic),),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Expanded(
                child: Container(
                  width: 300.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: defultColor,width: 1.0),
                 //   color:  f==true ?defultColor: null,
                  ),
                  child: MaterialButton(
                    splashColor: defultColor,
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Management_profile()) );

                    },
                    child: Text('Management Profile',style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold,color: defultColor,fontStyle: FontStyle.italic),),
                  ),
                ),
              ),
            ],
          ),
        ),
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
    height: 200,
    color: defultColor,
  ),
  clipper: CustomClipPath(),
);