
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hea_apps/Modeules/Manage_picture_patien/Cubit_Manage_picture_patien/cuibt_Manage_picture_patien_screen.dart';
import 'package:hea_apps/Modeules/Manage_picture_patien/Cubit_Manage_picture_patien/states_Manage_picture_patien_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';


class Manage_picturePatien extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CubitManage_picturePatien(),
      child: BlocConsumer<CubitManage_picturePatien,statesMangePicturePatient>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {

          var cubit= CubitManage_picturePatien.get(context);
          var cubitbefor=CubitManage_picturePatien.get(context).ImageBefor;
          var cubitAfter=CubitManage_picturePatien.get(context).ImageAfter;

          return Scaffold(
            appBar: AppBar(
              leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor,),)),
              backgroundColor: Colors.white,
              elevation: 0.0,
              title:  Text(
                "Manage pictures",
                style: TextStyle(color: defultColor),),

            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Column(
                     // AssetImage("assert/image/pci.jpg",),
                      children: [
                        Container(
                          width: 300,
                          child: Text(
                            "Picture Before you follow the diet plan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: defultColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Image(
                          image:cubitbefor != null ? FileImage(cubitbefor) as ImageProvider:
                          AssetImage("assert/image/pci.jpg",),
                          width: 300,
                          height: 300,
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: defultColor.withOpacity(0.7),
                              ),
                              child: MaterialButton(
                                onPressed: (){},
                                child: Text(
                                  "delet picture",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(width: 7.0,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: defultColor.withOpacity(0.7),
                              ),
                              child: MaterialButton(
                                onPressed: (){
                                  cubit.getImageBeforpatine();
                                },
                                child: Text(
                                  "add picture",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Column(
                      children: [
                        Container(
                          width: 300,
                          child: Text(
                            "Picture After you follow the diet plan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: defultColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Image(
                          image:cubitAfter != null ? FileImage(cubitAfter) as ImageProvider:
                          AssetImage("assert/image/pci.jpg",),
                          width: 300,
                          height: 300,
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: defultColor.withOpacity(0.7),
                              ),
                              child: MaterialButton(
                                onPressed: (){},
                                child: Text(
                                  "delet picture",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(width: 7.0,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: defultColor.withOpacity(0.7),
                              ),
                              child: MaterialButton(
                                onPressed: (){
                                  cubit.getImageAfterpatine();
                                },
                                child: Text(
                                  "add picture",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

        },

      ),
    );
  }
}
