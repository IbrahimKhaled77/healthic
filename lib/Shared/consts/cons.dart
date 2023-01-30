

/*Text.rich(
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

)*/

/*Icon(Icons.star,color: defultColor,),*/


/*

   actions: [
          MaterialButton(
              onPressed: (){},
              child: Row(
                children: [
                  Text("Rating",style: TextStyle(color: defultColor),),
                  Icon(Icons.star,color: defultColor,size: 17.0,),
                ],
              ),
          ),

        ],
 */

/*
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
 */
/*
 MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 1.0,
            onPressed: (){
              OpenRatingDialog(context);
            },
            child: Row(
              children: [
                Icon(Icons.star,color: defultColor,size: 17.0,),
                Text("Rating",style: TextStyle(color: defultColor),),
              ],
            ),
          ),
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


 */

/*

//شاشه الاحمر
switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              default:
                final data = snapshot.data!.docs;
 */

/*


 AwesomeDialog(
                                                btnCancelColor: Colors.redAccent,
                                                //dialogBackgroundColor: Colors.green,
                                                dialogType: DialogType.success,
                                                context:context,
                                                title:"success",
                                                body:Text("success"))..show()
 */
/*
NetworkImage(Diohelper.GetData(key: "UserImage")),
 */