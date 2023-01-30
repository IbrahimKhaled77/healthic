import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../Shared/Colors/Colors.dart';
import '../CreatProfile_patien/Creatprofile_screen_patien.dart';




class ShowLocationScreen extends StatefulWidget{
  const ShowLocationScreen(
      {Key? key, required this.latLang})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String latLang;


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ShowLocationScreen> {

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng startLocation =LatLng(31.888989, 35.920329);



  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  addMarkers() async {
    var splitag = widget.latLang.split(",");

    startLocation =LatLng(double.parse(splitag[0]), double.parse(splitag[1]));

    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(startLocation.toString()),
          position: startLocation, //position of marker
          infoWindow: InfoWindow( //popup info
            title: ' Point ',
            snippet: 'Car Marker',
          ),
          icon: BitmapDescriptor.defaultMarker,//Icon for Marker
        )
    );


    setState(() {


    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:AppBar(
          leading: Builder(builder: (context)=>IconButton(onPressed: (){},icon: Icon(Icons.arrow_back,color: defultColor),)),

          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            GoogleMap(
             //Map widget from google_maps_flutter package
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: CameraPosition( //innital position in map
                target: startLocation, //initial position
                zoom: 14.0, //initial zoom level
              ),
              markers: markers, //markers to show on map
              mapType: MapType.normal, //map type
              onMapCreated: (controller) { //method called when map is created
                setState(() {
                  mapController = controller;
                });
              },
            ),

          ]
        )
    );
  }

}