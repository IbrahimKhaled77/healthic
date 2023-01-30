import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';


class Manage_picture extends StatelessWidget {
  const Manage_picture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor,),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0.0,
        title:  Text(
          "pictures patient",
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
                   Image(image:  AssetImage("assert/image/pci.jpg",),
                     width: 300,
                     height: 300,),
                  SizedBox(height: 10.0,),

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
                    image:
                    AssetImage("assert/image/pci.jpg",),
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 10.0,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
