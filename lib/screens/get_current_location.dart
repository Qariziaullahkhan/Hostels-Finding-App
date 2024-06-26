import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hostels_finder_app/screens/markers_details_screen.dart';

class GetCurrentLocation extends StatefulWidget {
  const GetCurrentLocation({super.key});

  @override
  State<GetCurrentLocation> createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
   final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
//   List<Hostels> hostels = [];

  static const CameraPosition myPeshawar = CameraPosition(
    target: LatLng( 33.9394533,71.4879667),
    zoom: 14.4746,
  );
    final Set<Polyline>_polylines = {};

  List<LatLng>latling=[
    LatLng( 33.9394533,71.4879667),
    LatLng(33.9365, 71.4863),
    LatLng(33.9339,71.4849),
       

  ];
  final List<Marker>_markers =  <Marker>[
    Marker(markerId: const MarkerId("1"),
     position:const LatLng(34.0151, 71.5249),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      
      infoWindow:const InfoWindow(title: 'Peshawar', snippet: 'I am in Peshawar'),
    ),
    Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(34.0048, 71.5101),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      
        infoWindow: const InfoWindow(
          title: 'Tehkal',
          snippet: 'Hostels: Students',
        ),
    ),
  ];
  load(){
    getusercurrentlocation().then((value)async {
  print("My Current Location");
print(value.latitude.toString() +" "+value.longitude.toString());
_markers.add(
  Marker(markerId: MarkerId("3"),
  
  position: LatLng(value.latitude, value.longitude),
  onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return MarkerDetailScreen();
    }));
  },

  infoWindow:const InfoWindow(
    title: "My Current Location",
    snippet: "I am in Peshawar"
  ),
  ),
);
CameraPosition cameraPosition = CameraPosition(
  zoom: 14,
  target:LatLng(value.latitude, value.longitude),
 

 );
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  setState(() {
    
  });

});
  }
  Future<Position> getusercurrentlocation() async {
      await Geolocator.requestPermission()
          .then((value) {})
          .onError((error, stackTrace) async {
        await Geolocator.requestPermission();
        print("ERROR" + error.toString());
        
      });
      return await Geolocator.getCurrentPosition();
  }
  @override
  void initState() {
    load();
    super.initState();
     for(int i = 0 ; i < latling.length ; i++){
       _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(i.toString()),
          //_lastMapPosition is any coordinate which should be your default
          //position when map opens up
          position: latling[i],
          infoWindow: const InfoWindow(
            title: 'Pishtakhare Bala',
            snippet: 'Good Hostels',
          ),
          icon: BitmapDescriptor.defaultMarker,

        ));
        setState(() {
          
        });
           _polylines.add(Polyline(
          polylineId: PolylineId(i.toString()),
          visible: true,
          //latlng is List<LatLng>
          points: latling,
        //  points: latlng[i],

          color: Colors.red,
        ));
     }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
         mapType: MapType.normal,
          polylines:_polylines,
        myLocationEnabled: true,
        markers: Set<Marker>.of(_markers),
        compassEnabled: true,
        initialCameraPosition: myPeshawar,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
//   
         ),
         floatingActionButton: FloatingActionButton(onPressed: ()async{

         },
         child: const Icon(Icons.location_on),
         ),
    );
  }
}