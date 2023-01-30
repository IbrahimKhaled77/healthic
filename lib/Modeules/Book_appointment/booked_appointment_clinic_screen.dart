import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';


class booked_appointment_clinic_screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor,),)),
        title: Text(
          "Book appointment",
          style: TextStyle(
            color: defultColor,
          ),
        ),
      ),
      body:
      Padding(
        padding: EdgeInsetsDirectional.all(7.0),
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: (NetworkImage('https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock--480x320.jpg')),

                    ),
                    SizedBox( width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Abdarahman shaheen' ,style: TextStyle(fontSize: 18.0),),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 90.0,top: 10.0),
                            child: Text('nutritionist ' ,style: TextStyle(fontSize: 15.0),),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: defultColor,
                    ),
                    child: MaterialButton(
                      onPressed: (){},
                      child: Text(
                        'Book appointment clinical',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),

                      ),
                    )

                    ,
                  ),

                ],
              ),
              SizedBox(height: 25.0,),
              Container(
                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.all(7.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            //NAME OF MOUNDAY
                            Container(
                              padding: EdgeInsetsDirectional.all(20.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: defultColor,
                              ),
                              child:Text('Sun'),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            //time
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: defultColor,
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('2-3 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('3-4 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('4-5 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: defultColor,
                              ),
                              child:MaterialButton(child: Text('5-6 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(

                      padding: EdgeInsetsDirectional.all(7.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            //NAME OF MOUNDAY
                            Container(
                              padding: EdgeInsetsDirectional.all(20.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: defultColor,
                              ),
                              child:Text('Mon'),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            //time
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('2-3 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),

                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color:  defultColor,
                              ),
                              child:MaterialButton(child: Text('3-4 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('4-5 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('5-6 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(

                      padding: EdgeInsetsDirectional.all(7.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            //NAME OF MOUNDAY
                            Container(
                              padding: EdgeInsetsDirectional.all(20.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: defultColor,
                              ),
                              child:Text('Tus'),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            //time
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color:  defultColor,
                              ),
                              child:MaterialButton(child: Text('2-3 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('3-4 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color:  defultColor,
                              ),
                              child:MaterialButton(child: Text('4-5 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(

                      padding: EdgeInsetsDirectional.all(7.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            //NAME OF MOUNDAY
                            Container(
                              padding: EdgeInsetsDirectional.all(20.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: defultColor,
                              ),
                              child:Text('Wed'),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            //time
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('2-3 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color:  defultColor,
                              ),
                              child:MaterialButton(child: Text('3-4 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color:  defultColor,
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(

                      padding: EdgeInsetsDirectional.all(7.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            //NAME OF MOUNDAY
                            Container(
                              padding: EdgeInsetsDirectional.all(20.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: defultColor,
                              ),
                              child:Text('Fri'),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            //time
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color:  defultColor,
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('4-5 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('2-3 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('3-4 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                color: Colors.green[100],
                              ),
                              child:MaterialButton(child: Text('1-2 pm'),onPressed: (){},),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),



                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
