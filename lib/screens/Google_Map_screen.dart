// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hostels_finder_app/screens/Hostels_details_screen.dart';
// import 'package:hostels_finder_app/screens/Login_screen.dart';
// import 'package:hostels_finder_app/widget/Custome_appbar.dart';

// import '../model/Hostels_data.dart';
// import 'City_screen.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();
//   List<Hostels> hostels = [];

//   static const CameraPosition myPeshawar = CameraPosition(
//     target: LatLng(34.0151, 71.5249),
//     zoom: 14.4746,
//   );

//   Set<Marker> markers = {};
//   @override
//   void initState() {
//     markers.add(Marker(
//       markerId: MarkerId('1'),
//       position: LatLng(34.0151, 71.5249),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
//       // icon: BitmapDescriptor.defaultMarkerWithHue(
//       //     //   BitmapDescriptor.hueGreen
//       //     // ),
//       infoWindow: InfoWindow(title: 'Peshawar', snippet: 'I am in Peshawar'),
//     ));
//     markers.add(Marker(
//       markerId: MarkerId('2'),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//       position: LatLng(34.0048, 71.5101),
//       infoWindow: InfoWindow(title: 'tehkal bala', snippet: 'I am in Tehkal'),
//     ));

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     CameraPosition? cameraPosition;
//     Future<Position> Getusercurrentlocation() async {
//       await Geolocator.requestPermission()
//           .then((value) {})
//           .onError((error, stackTrace) async {
//         await Geolocator.requestPermission();
//         print("ERROR" + error.toString());
//       });
//       Position position = await Geolocator.getCurrentPosition();
//       cameraPosition = CameraPosition(
//         target: LatLng(position.latitude, position.longitude),
//         zoom: 14,
//       );
//       setState(() {
//           // var vehicalFullMap = Map<String, dynamic>.from(vehicalSnapshot as Map);
//         markers.add(Marker(
//           markerId: MarkerId("3"),
//           position: LatLng(position.latitude, position.longitude),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//           infoWindow: const InfoWindow(
//             title: 'My Current Location',
//           ),
//           onTap: () {
//           // Hostels hostels = Hostels.fromMap(Map<String,dynamic>.from(hostels));
//           // Navigator.of(context).push(MaterialPageRoute(builder: (context){
//           //   return  HostelsDetailScreen(hostels:hostels);
//           // }));
//           },
          
//         ));
//         print(hostels.length);
//         setState(() {
          
//         });
//       });
//       return await Geolocator.getCurrentPosition();
//     }

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await Getusercurrentlocation();
    
//           GoogleMapController controller = await _controller.future;
//           //  controller
//           //    .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    
//           // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           //   return const CityMapScreen();
//           // }));
//         },
//         child: const Icon(Icons.location_on),
//       ),
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         title: const Text(
//           "Google Map Screen",
//           style: TextStyle(
//               fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: GoogleMap(
//         mapType: MapType.terrain,
//         myLocationEnabled: true,
//         markers: markers,
//         compassEnabled: true,
//         initialCameraPosition: myPeshawar,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     );
//   }
// }
//  // var markers = {
//     //   (Marker(
//     //     markerId: const MarkerId('1'),
//     //     position: const LatLng(34.0151, 71.5249),
//     //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//     //     // icon: BitmapDescriptor.defaultMarkerWithHue(
//     //     //   BitmapDescriptor.hueGreen
//     //     // ),
//     //     infoWindow: const InfoWindow(
//     //       title: 'Peshawar',
//     //       snippet: 'Hostels: Students',
//     //     ),
//     //   )),
//     //   (Marker(
//     //     markerId: const MarkerId('2'),
//     //     position: const LatLng(34.0048, 71.5101),
//     //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//     //     // icon: BitmapDescriptor.defaultMarkerWithHue(
//     //     //   BitmapDescriptor.hueGreen
//     //     // ),
//     //     infoWindow: const InfoWindow(
//     //       title: 'Tehkal',
//     //       snippet: 'Hostels: Students',
//     //     ),
//     //   )),
//     //   (Marker(
//     //     markerId: const MarkerId('3'),
//     //     position: const LatLng(33.9999, 71.5309),
//     //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
//     //     // icon: BitmapDescriptor.defaultMarkerWithHue(
//     //     //   BitmapDescriptor.hueGreen
//     //     // ),
//     //     infoWindow: const InfoWindow(
//     //       title: 'Peshawar Cantoment',
//     //       snippet: 'Hostels: Students',
//     //     ),
//     //   )),
//     // };