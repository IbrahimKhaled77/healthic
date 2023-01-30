
import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ViewRateNutritionist extends StatefulWidget {
  @override
  State<ViewRateNutritionist> createState() => _ViewRateNutritionistState();
}

class _ViewRateNutritionistState extends State<ViewRateNutritionist> {
var v=true;
List<double>rat=[0.1,0.3,0.5,0.7,0.9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor,),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:  Text("View Rate",style: TextStyle(color: defultColor, fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,),),

      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(
                vertical:16.0 ,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 16.0,right: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "4.5",
                                style: TextStyle(fontSize: 48.0,),
                              ),
                              TextSpan(
                                text: "/5",
                                style: TextStyle(fontSize: 24.0,),
                              ),
                            ],

                          ),

                        ),
                        SizedBox(height: 7.0,),
                        SmoothStarRating(
                          starCount: 5,
                          rating: 4.5,
                          allowHalfRating: false,
                          color: defultColor,
                          borderColor: defultColor,
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                            "10 Reviews",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: defultColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context, index) => Row(
                          children: [
                            Text("${index+1}",style: TextStyle(fontSize: 20.0),),
                            SizedBox(width: 4.0,),
                            Icon(Icons.star,color: defultColor,),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width/2.8,
                              percent: rat[index],
                              lineHeight: 6.0,
                              progressColor: defultColor,
                              animation: true,
                              animationDuration: 2500,
                            ),
                          ],
                        ),
                        itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom:8.0 ,top: 8.0),
                itemBuilder: (context,index)=>bulidItems(),
                separatorBuilder: (context,index)=>Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    height: 1.0,
                  ),
                ),
                itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }


    bulidItems()=>Padding(
      padding: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 16.0,right: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(

                radius: 30.0,

                child: ClipOval(

                  child: Image(

                    image: AssetImage("assert/image/as.jpg",),

                    height: 90.0,

                    width: 90.0,

                    fit: BoxFit.cover,

                  ),

                ),

              ),
              SizedBox(width: 10,),
              Text(
                "User name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_vert,color: Colors.grey[400],),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            children: [
              SmoothStarRating(
                starCount: 5,
                rating: 3.5,
                allowHalfRating: false,
                color: defultColor,
                borderColor: defultColor,
              ),
              SizedBox(width:7.0 ,),
              Text(
                "06 jun 2021",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          //تعديل انو اكبس عللى وحده بس ببين وحده مش كل
          GestureDetector(
            onTap: (){
            setState(() {
              v=!v;
            });
            },
            child: v? Text(
              "Lorem ipsum comments Lorem ipsum comments Lorem ipsum comments Lorem ipsum comments Lorem ipsum commentsLorem ipsum comments Lorem ipsum comments ",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 17.0,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ) :
            Text(
              "Lorem ipsum comments Lorem ipsum comments Lorem ipsum comments Lorem ipsum comments Lorem ipsum commentsLorem ipsum comments Lorem ipsum comments ",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
}
