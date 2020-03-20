import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }
    double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Bangladesh Quarantine Zones"),
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          
         // _buildContainer(),
        ],
      ),
    );
  }

 Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 Widget _zoomplusfunction() {
   
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(23.6850, 90.3563), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(23.6850, 90.3563), zoom: zoomVal)));
  }

Marker chandpur = Marker(
  markerId: MarkerId('chandpur'),
  position: LatLng(23.2513, 90.8518),
  infoWindow: InfoWindow(title: 'Chandpur'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("608 people is in home qurantine."),));
},
);
Marker manikganj = Marker(
  markerId: MarkerId('manikganj'),
  position: LatLng(23.8617, 90.0003),
  infoWindow: InfoWindow(title: 'Manikganj'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("221 people is in home qurantine."),));
},
);

Marker shariatpur = Marker(
  markerId: MarkerId('shariatpur'),
  position: LatLng(23.2423, 90.4348),
  infoWindow: InfoWindow(title: 'Shariatpur'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("192 people is in home qurantine."),));
},
);

Marker kishoreganj = Marker(
  markerId: MarkerId('kishoreganj'),
  position: LatLng(24.4260, 90.9821),
  infoWindow: InfoWindow(title: 'Kishoreganj'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("81 people is in home qurantine."),));
},
);

Marker narayanganj = Marker(
  markerId: MarkerId('narayanganj'),
  position: LatLng(23.6238, 90.5000),
  infoWindow: InfoWindow(title: 'Narayanganj'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("40 people is in home qurantine."),));
},
);

Marker madaripur = Marker(
  markerId: MarkerId('madaripur'),
  position: LatLng(23.2393, 90.1870),
  infoWindow: InfoWindow(title: 'Madaripur'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("40 people is in home qurantine."),));
},
);

Marker jhenaidah = Marker(
  markerId: MarkerId('jhenaidah'),
  position: LatLng(23.5450, 89.1726),
  infoWindow: InfoWindow(title: 'Jhenaidah'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("22 people is in home qurantine."),));
},
);
Marker chittagong = Marker(
  markerId: MarkerId('chittagong'),
  position: LatLng(22.3569, 91.7832),
  infoWindow: InfoWindow(title: 'Chittagong'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("21 people is in home qurantine."),));
},
);

Marker narsingdi = Marker(
  markerId: MarkerId('narsingdi'),
  position: LatLng(24.1344, 90.7860),
  infoWindow: InfoWindow(title: 'Narsingdi'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("13 people is in home qurantine."),));
},
);

Marker gopalganj = Marker(
  markerId: MarkerId('gopalganj'),
  position: LatLng(24.1344, 90.7860),
  infoWindow: InfoWindow(title: 'Gpalganj'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
  onTap:  (){
  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("11 people is in home qurantine."),));
},
);
Set<Marker> getMakrker(){
  Set<Marker> marker = {chandpur,manikganj,shariatpur,kishoreganj,narayanganj,madaripur,jhenaidah,chittagong,narsingdi,gopalganj};


  return marker;
}

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(23.6850, 90.3563), zoom: 6),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        
        markers: getMakrker(),
        
      ),
    );
  }


}

