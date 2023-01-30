import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';


class payments extends StatelessWidget {
  var cbvar = false;
  //const payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: defultColor,),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add Card',
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(

          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Icon(Icons.credit_card,
                      color: Colors.teal,),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Credit/Debit Card',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),

                  ],
                ),





                SizedBox(
                  height: 31.0,
                ),

                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Cardhlder Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.account_box_outlined,
                        color: Colors.teal,)


                  ),


                ),


                SizedBox(
                  height: 20.0,
                ),


                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Card Number',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.credit_card_outlined,
                        color: Colors.teal,)

                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),


                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      hintText: 'Expiration Date',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.date_range,
                        color: Colors.teal,)

                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Cvv',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers,
                        color: Colors.teal,)

                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),


               /* Row(
                  children: [
                    Checkbox(value: cbvar, onChanged: (value){
                      // SetState((){
                      //  cbvar =value ;

                    }//);
                      //debugPrint("Value is $value");

                      //  }
                    ),
                    Text('Save this card for faster payments'),
                  ],
                ),*/
                // ],
                //  ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.teal,
                  ),
                  width: double.infinity,

                  child: MaterialButton(
                    onPressed: (){},
                    child: Text('Pay Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),

                  ),
                ),

              ]
          ),
        ),
      ),

    );

  }
}