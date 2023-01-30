import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Rate_nutritionist/Rating_Dialog/Rating_Nurtion_Screen_dialoge.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            MaterialButton(
                onPressed: (){
                  OpenRatingDialog(context);
                },
              child:Text("rate") ,



            ),
          ],
        ) ,
      ),
    );
  }

  OpenRatingDialog(context){

    return showDialog(context: context, builder:(context){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Dialog(
          child: Rating_Nurtions(),
        ),
      );

    });

  }



}
