import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hostels_finder_app/utility/flutter_toast.dart';
import 'package:hostels_finder_app/widget/Custome_appbar.dart';
import 'package:hostels_finder_app/widget/Custome_buttton.dart';

class CityMapScreen extends StatefulWidget {
  const CityMapScreen({super.key});

  @override
  State<CityMapScreen> createState() => _CityMapScreenState();
}

class _CityMapScreenState extends State<CityMapScreen> {
  TextEditingController CityC = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(34.0151, 71.5249),
    zoom: 14.4746,
  );
  @override
  void initState() {
    markers.add(const Marker(
      markerId: MarkerId('1'),
      position: LatLng(34.0151, 71.5249),
      infoWindow: InfoWindow(title: 'Peshawar', snippet: 'Hostels: Students'),
    ));
    super.initState();
  }

  Set<Marker> markers = {};
  @override
  void dispose() {
    CityC.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(titleText: "Serach Area"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: CityC,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              
              foregroundColor: Colors.white
              ),
              onPressed: () async {
                String CityName = CityC.text.trim();
                if (CityName.isEmpty) {
                  List<Location> locations =
                      await locationFromAddress(CityName);
                  Utils.toastmessage(
                      "Total locations ${locations.length}", Colors.pink);
                  print(locations.length);

                  if (locations.isNotEmpty) {
                    Location location = locations[0];

                    cameraPosition = CameraPosition(
                      target: LatLng(location.latitude, location.longitude),
                      zoom: 14.4746,
                    );

                    markers.add(Marker(
                      markerId: MarkerId(CityName),
                      position: LatLng(location.latitude, location.longitude),
                      infoWindow: InfoWindow(
                          title: CityName, snippet: 'I am in $CityName'),
                    ));

                    GoogleMapController controller = await _controller.future;
                    controller.animateCamera(
                        CameraUpdate.newCameraPosition(cameraPosition));

                    setState(() {});
                  }
                } else {}
              },
              child: const Text("Search"),
            ),
            Expanded(
              child: GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onTap: (LatLng location) {
                  markers.add(Marker(
                    markerId: MarkerId(location.toString()),
                    position: LatLng(location.latitude, location.longitude),
                  ));

                  setState(() {});
                },
                mapType: MapType.hybrid,
                initialCameraPosition: cameraPosition,
                  mapToolbarEnabled: true,
                  markers: markers,
                  compassEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
