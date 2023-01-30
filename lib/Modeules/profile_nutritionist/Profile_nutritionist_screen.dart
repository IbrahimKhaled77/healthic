
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Book_appointment/booked_appointment_online_screen.dart';
import 'package:hea_apps/Modeules/Edit_Nutritionist_profile/Edit_Nutritionst_profile_screen.dart';
import 'package:hea_apps/Modeules/Location/ShowLocation_Screen.dart';
import 'package:hea_apps/Modeules/Management_profilr/Informa_profile/View_CV/CV.dart';
import 'package:hea_apps/Modeules/View_Rate_Nutritions/view_rate_nutritionist_screen.dart';
import 'package:hea_apps/Modeules/appointments_profile_nutritionst/Appoinyments_profile_nutritionst_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';


class ProfileNutritionist extends StatefulWidget {
  const ProfileNutritionist(
      {Key? key, required this.id,required this.spizlezedName,required this.spizlezedImage,required this.spizlezedAge,
      required this.spizlezedGender, required this.spizlezedCv,required this.spizlezedPhone,required this.cansearsh,required this.myCover,required this.isClinc,required this.latlang})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String id;
  final String spizlezedName;
  final String spizlezedImage;
  final String spizlezedAge;
  final String spizlezedGender;
  final String spizlezedCv;
  final String spizlezedPhone;
  final String cansearsh;
  final String myCover;
  final String isClinc;
  final String latlang;


  @override
  State<ProfileNutritionist> createState() => _ProfileNutritionistState();
}


class _ProfileNutritionistState extends State<ProfileNutritionist> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){},icon: Icon(Icons.arrow_back,color: defultColor),)),

        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
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
                            widget.myCover ==""?
                            'https://tse2.mm.bing.net/th?id=OIP.At9CpPJanT2mDg-DAdCJQwHaE8&pid=Api&P=0}':widget.myCover,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    alignment: AlignmentDirectional.topCenter,
                  ),
                  CircleAvatar(
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
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                widget.spizlezedName,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 7.0,),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                widget.spizlezedPhone,
                style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey[600],fontSize: 15.0),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                widget.cansearsh == "true"?"profile accept":"profile pinding",
                style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.green[600],fontSize: 15.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            widget.spizlezedAge,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            'Age',
                            style: Theme.of(context).textTheme.caption!.copyWith(color:defultColor,fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "4.5",
                                      style: Theme.of(context).textTheme.subtitle2,
                                    ),
                                    TextSpan(
                                      text: "/5",
                                      style:Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ],

                                ),

                              ),
                              Icon(Icons.star,color: defultColor,size: 16.0,),
                            ],
                          ),
                          Text(
                            'rating',
                            style: Theme.of(context).textTheme.caption!.copyWith(color:defultColor,fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            widget.spizlezedGender,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            'ganter',
                            style: Theme.of(context).textTheme.caption!.copyWith(color:defultColor,fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(

                      child: Column(
                        children: [
                          Text(
                           (widget.isClinc).toString().split('.').last =="isTrue"? "Clinic":"online",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            (widget.isClinc).toString().split('.').last =="isTrue"? "Location":"",

                            style: Theme.of(context).textTheme.caption!.copyWith(color:defultColor,fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ShowLocationScreen(latLang: widget.latlang,)),
                                (route) => false);
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            'view cv ',
                            style: Theme.of(context).textTheme.caption!.copyWith(color:defultColor,fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ViewCV_Screen(imgCv:widget.spizlezedCv)));

                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            'view rating',
                            style: Theme.of(context).textTheme.caption!.copyWith(color:defultColor,fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>ViewRateNutritionist()));
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            'Appointments ',
                            style: Theme.of(context).textTheme.caption!.copyWith(color:defultColor,fontSize: 15.0),
                          ),
                        ],
                      ),
                      onTap: () {
                        OpenRatingDialog(context);
                      },
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 10.0,),

          ],
        ),
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
          child: Appointments_profile_nutritions(id: widget.id, image: widget.spizlezedImage, name: widget.spizlezedName,isClinc:widget.isClinc),
        ),
      );

    });

  }




}



