

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Shealt_Compnent/Constants.dart';
import 'package:page_transition/page_transition.dart';

class AnimLogohApp extends StatelessWidget {
  const AnimLogohApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assert/image/logogApp.svg'),
                  ) ,


                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Text("Healthic",style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),),
          ],
        ),
        backgroundColor: defultColor,
        nextScreen:  FirstWidget!,
        duration: 3000,
        splashIconSize: 250,
        splashTransition:SplashTransition.slideTransition ,
        pageTransitionType:PageTransitionType.topToBottom ,
        animationDuration: const Duration(seconds: 1),
    );
  }
}
