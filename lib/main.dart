import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hea_apps/Layout/Health_Layout/health_patien_Layout_Screen.dart';
import 'package:hea_apps/Modeules/CreatProfile_Specialized/CubitCreatprofile/Cubit.dart';
import 'package:hea_apps/Modeules/HomeCreatScreen/OnBoarding_Creat_Screen.dart';
import 'package:hea_apps/Modeules/Location/Location_Screen.dart';
import 'package:hea_apps/Modeules/Login_heath/LoginScreen_heath.dart';
import 'package:hea_apps/Modeules/Logo_app_Adman/Logog_Adim_screen.dart';
import 'package:hea_apps/Modeules/Logo_app_frist/Animat_Logog_App_screen.dart';
import 'package:hea_apps/Modeules/OnBoarding/OnBoardingSceeren.dart';
import 'package:hea_apps/Modeules/Register_noutris/Register_Specialized_Screen.dart';
import 'package:hea_apps/Modeules/Register_patient/Register_Patien_Screen.dart';
import 'package:hea_apps/Shared/Networkes/Block_observer/Bloc_observer.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';
import 'package:hea_apps/Shared/Shealt_Compnent/Constants.dart';

import 'Layout/Health_Layout/health_Specialized_Layout_Screen.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
 await Diohelper.init();
 Firebase.initializeApp();

 bool? onBoarding=Diohelper.GetData(key:'OnBoarding');
   login=Diohelper.GetData(key:'Login');
   Patient=Diohelper.GetData(key:'patient');
   specialized=Diohelper.GetData(key:'Specialized');
   rasterpatient =Diohelper.GetData(key:'Rasterpatient');
   RasterSpecialized =Diohelper.GetData(key:'RasterSpecialized');
   creatpatient =Diohelper.GetData(key:'Creatpatient');
   creatSpecialized =Diohelper.GetData(key:'creatSpecialized');
  print(onBoarding);//true
  print(login);//null
  print(Patient);//صفحه تسجيل دخول الاول مره لما اكبس عللى مريض true
  print(specialized);//null لما اكبس عللى متخصص
  print(rasterpatient);//true
  print(RasterSpecialized);//true
  print(creatpatient);//true
  print(creatSpecialized);//null


  FirstWidget;
   if(onBoarding ==null)//true
     FirstWidget=OnBoarding();
   else if(Patient==null && specialized==null )
     FirstWidget= HomeCreatScreen();
   else if(creatSpecialized==true)
     FirstWidget=healthLayout_Specialized();
   else if(creatpatient == true){
     FirstWidget=healthLayout_patien();
   }
   else
     FirstWidget=LoginScreenHeath();
  runApp(MyApp(FirstWidget));
}


class MyApp extends StatelessWidget {
final Widget? FirstWidget;
MyApp(this.FirstWidget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) => CreatProfileSpecializedcubit()),
      ],
      child: MaterialApp(
               theme: ThemeData(
                 dialogTheme: DialogTheme(
                   backgroundColor: Colors.white,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(24),
                   ),
                 ),
               //  primarySwatch: defultColor,
                // buttonTheme: ButtonThemeData(buttonColor: Colors.teal),
                // fontFamily: "Janna",
               ),
          debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.ltr,
            child: AnimLogohApp(),
        ),
      ),
    );
  }
}
//onBoarding == true ? LoginScreenHeath():