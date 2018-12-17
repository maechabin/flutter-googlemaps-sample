import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('flutter-googlemaps-sample')),
      body: MapsDemo(),
    ),
  ));
}

class MapsDemo extends StatefulWidget {
  @override
  State createState() => MapsDemoState();
}

class MapsDemoState extends State<MapsDemo> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 640,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
              ),
            ),
          ),
          RaisedButton(
            child: const Text('Go to London'),
            onPressed: mapController == null
                ? null
                : () {
                    mapController.animateCamera(CameraUpdate.newCameraPosition(
                      const CameraPosition(
                        bearing: 270.0, // 方角
                        target: LatLng(51.5160895, -0.1294527), // 位置情報
                        tilt: 3.0, // カメラの角度
                        zoom: 17.0, // カメラのズームレベル
                      ),
                    ));
                    mapController.addMarker(MarkerOptions(
                        position: LatLng(51.5160895, -0.1294527),
                        infoWindowText: InfoWindowText(
                            'London', '51.5160895, -0.1294527')));
                  },
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
