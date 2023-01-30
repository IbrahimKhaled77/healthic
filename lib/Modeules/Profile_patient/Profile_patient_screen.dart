
import 'package:flutter/material.dart';
import 'package:hea_apps/Modeules/Edit_profile_patien/Edit_Profile_patien_screen.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:hea_apps/Shared/Networkes/Logical/Diohelper.dart';

class  ProfilePatient extends StatefulWidget {

  const ProfilePatient(
      {Key? key, required this.id,required this.spizlezedName,required this.spizlezedImage,required this.spizlezedAge,
        required this.spizlezedGender, required this.spizlezedCv,required this.spizlezedPhone,
      required this.spizlezedWidght,required this.spizlezedHeight ,required this.diseases})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String id;
  final String spizlezedName;
  final String spizlezedImage;
  final String spizlezedAge;
  final String spizlezedGender;
  final String spizlezedCv;
  final String spizlezedPhone;
  final String spizlezedWidght;
  final String spizlezedHeight;
  final String diseases;


  @override
  State<ProfilePatient> createState() => _ProfilePatientState();
}

class _ProfilePatientState extends State<ProfilePatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor),)),
        title: Text("Profile ",style: TextStyle(color: defultColor,fontStyle: FontStyle.italic),),
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

                          image: NetworkImage(Diohelper.GetData(key: "myCover")==""?'https://tse2.mm.bing.net/th?id=OIP.At9CpPJanT2mDg-DAdCJQwHaE8&pid=Api&P=0}':Diohelper.GetData(key: "myCover")),
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
                          Text(
                            widget.spizlezedWidght,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            'weight',
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
                            widget.spizlezedHeight,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            'height',
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
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              width: 240,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("diseases",style: TextStyle(color: defultColor,fontSize: 15.0),),
                  SizedBox(height: 7.0,),
                  Text(widget.diseases,
                    style: TextStyle(color: Colors.grey[600],fontSize: 15.0),),
                ],
              ),
            ),

          ],
        ),
      ),
    );


}
}


