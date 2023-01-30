
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hea_apps/Modeules/HomeCreatScreen/OnBoarding_Creat_Screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingUser{
  String?image;
  String?title;
  String?text;

  OnBoardingUser({
    required this.image,
    required this.title,
    required this.text,


  } );

}



class OnBoarding extends StatefulWidget {

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<OnBoardingUser>OnBoardinguserItems=[
    OnBoardingUser(
        image: 'assert/image/qw1.png',
        title: "Flexible Operaling\n Hours",
        text: "Our new service makes it easy for you to  work anywhere,ther are new features  will really help you.",

    ),
    OnBoardingUser(
      image: 'assert/image/qw2.png',
      title: "Clinical Management",
      text: "Our new service makes it easy for you to  work anywhere,ther are new features  will really help you.",

    ),
    OnBoardingUser(
      image: 'assert/image/qw3.png',
      title: "Satisfactory Health \n Analysis",
      text: "Our new service makes it easy for you to  work anywhere,ther are new features  will really help you.",

    ),

  ];

var controllerPageView=PageController();

  bool IsShow=false;
  OnBoardingUser? modles;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       //appBar: AppBar(),
       backgroundColor: Colors.white,
        body:Column(

          children: [

            Container(
              child: Column(
                children: [
                  SizedBox(height: 10.0,),
                  SvgPicture.asset('assert/image/logogApp.svg',height: 100,width: 100,),
                  SizedBox(height: 5.0,),
                  Text("Healthic",style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    Expanded(
                      child: PageView.builder(
                          itemBuilder: (context,index)=>bulideritems(context,OnBoardinguserItems[index]),
                        physics: BouncingScrollPhysics(),
                        itemCount: OnBoardinguserItems.length,
                        controller:controllerPageView ,
                        onPageChanged: (index){
                            if(index==OnBoardinguserItems.length-1){
                              setState(() {
                                IsShow=true;
                              });
                            }else{
                              setState(() {
                                IsShow=false;
                              });

                            }

                        },
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      ),
                    ),
                    SizedBox(height: 50.0,),
                    Row(
                      children: [
                        if(!IsShow)
                        SmoothPageIndicator(
                            controller: controllerPageView,
                            count: OnBoardinguserItems.length,
                          effect:ExpandingDotsEffect(
                            dotHeight: 6.0,
                            dotWidth: 7.0,
                            dotColor: Colors.grey,
                            spacing: 6.0,
                            activeDotColor: defultColor as Color,
                            expansionFactor: 4.0,
                          ) ,
                        ),
                        if(!IsShow)
                        Spacer(),
                        if(!IsShow)
                        MaterialButton(

                          onPressed: () {
                            controllerPageView.nextPage(
                                duration: Duration(
                                  milliseconds: 700,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn,
                            );
                          },
                         child: Icon(Icons.arrow_forward, color: defultColor,size: 25.0,),
                        ),
                        if(IsShow)
                        Expanded(
                          child: Container(
                            width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(25.0),
                            color: defultColor,
                          ),
                          child: MaterialButton(
                               onPressed: (){
                                 Diohelper.SaveData(key:'OnBoarding', value: true).then((value) {
                                   if(value){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>HomeCreatScreen(),), (route) => false);
                                   }
                                 });
                               },
                               child: Text(
                                 "Get Started",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontStyle: FontStyle.normal,
                                   fontWeight: FontWeight.bold,
                                   fontFamily: 'Outfit',
                                   fontSize: 18.0,
                                 ),
                               ),
                           ),
                      ),
                        ),



                  ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





Widget bulideritems(context,OnBoardingUser models)=>Column(
  //crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Padding(
         padding: EdgeInsets.zero,
        child: Image(
          image: AssetImage('${models.image}')),
      ),
    ),
   //SizedBox(height: 70.0,),
    Text(
      '${models.title}',
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 10.0,),
    Text(
      '${models.text}',
      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 18.0),
      textAlign: TextAlign.start,

    ),
  ],
);


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
    height: 200,
    color: defultColor,
  ),
  clipper: CustomClipPath(),
);


/*Image(
image: AssetImage('${models.image}'),



),*/