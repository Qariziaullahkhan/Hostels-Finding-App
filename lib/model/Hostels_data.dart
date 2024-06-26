import 'package:flutter/rendering.dart';

class Hostels{
  late String CityName;
late String HostelName;
late String OwnerName;
late String Phone;
late String availablerooms;
late String RentRooms;
late String totalrooms;
late String facilities;
late String CreatedOn;
late String photos;
Hostels({
required this.CityName, required this.HostelName,required this.OwnerName,
required this.Phone,required this.availablerooms,required this.RentRooms,required this.totalrooms,required this.facilities,
required this.CreatedOn,required this.photos
});

 Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'CityName': CityName,
      'HostelName': HostelName,
      'OwnerName': OwnerName,
      'Phone': Phone,
      'availablerooms': availablerooms,
      'RentRooms': RentRooms,
      'totalrooms': totalrooms,
      'facilities': facilities,
      'CreatedOn': CreatedOn,
      'photos': photos,
    
    };

    return map;
  }

  factory Hostels.fromMap(Map<String, dynamic> map) {
    return Hostels(
      CityName: map['CityName'],
      HostelName: map['HostelName'],
      OwnerName: map['OwnerName'],
      Phone: map['Phone'],
      availablerooms: map['availablerooms'],
      RentRooms: map['RentRooms'],
      totalrooms: map['totalrooms'],
      facilities: map['facilities'],
      CreatedOn: map['CreatedOn'],
      photos: map['photos'],
    );
  }
}