
import 'package:flutter/material.dart';
import 'package:hea_apps/Shared/Colors/Colors.dart';

class ViewCV_Screen extends StatefulWidget {

  const ViewCV_Screen(
      {Key? key, required this.imgCv})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String imgCv;

  @override
  State<ViewCV_Screen> createState() => _ViewCV_ScreenState();
}

class _ViewCV_ScreenState extends State<ViewCV_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Image(image: NetworkImage(widget.imgCv),),
                SizedBox(
                  height: 15.0,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Container(
                    width: 100.0,
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back ,color: defultColor,),
                          SizedBox(width: 5.0,),
                          Text(
                            "back",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: defultColor,
                            ),
                          ),

                        ],
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
