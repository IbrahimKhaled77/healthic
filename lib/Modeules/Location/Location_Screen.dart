import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../CreatProfile_Specialized/Creatprofile_Screen_Specialized.dart';
import '../CreatProfile_patien/Creatprofile_screen_patien.dart';




class LocationScreen extends StatefulWidget{
  const LocationScreen(
      {Key? key, required this.name, required this.email, required this.pass, required this.type})
      : super(key: key);

  // Step 2 <-- SEE HERE
  final String name;
  final String email;
  final String pass;
  final String type;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<LocationScreen> {

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map

  LatLng startLocation =LatLng(31.888989, 35.920329);




  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  addMarkers() async {

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

        body: Stack(
          children: [
            GoogleMap(
              onTap: (latlang){
                if(markers.length>=1)
                {
                  markers.clear();
                }

                _onAddMarkerButtonPressed(latlang);
              },//Map widget from google_maps_flutter package
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
            Container(

              child: InkWell(
                onTap: (){
                  if(widget.type == "1"){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Creatprofilepatien(name: widget.name, email: widget.email, pass: widget.pass, latLng: startLocation.toString(),)), (route) => false);

                  }else{
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>CreatprofileSpecialized(name: widget.name, email: widget.email, pass: widget.pass, latLng: startLocation.toString(),)), (route) => false);

                  }

                },
                child: Text(
                  'next',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              alignment: Alignment.bottomCenter,
            )
          ]
        )
    );
  }
  void _onAddMarkerButtonPressed(LatLng latlang) {
    //loadAddress(latlang);
   // _latLng = latlang;
    print(latlang.toString());
    startLocation=LatLng(latlang.latitude,latlang.longitude);
    setState(() {
      markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(startLocation.toString()),
        position: latlang,
        infoWindow: InfoWindow(
          title: "Point",
          //  snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}