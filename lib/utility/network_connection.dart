// import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnection
{
 void Checkstatus() async {

    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      print("connected to Mobile Network");

      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
            print("connected to Wifi Network");

      // I am connected to a wifi network.
    }
    else{
      print("No internet connection");
    }

  }
}