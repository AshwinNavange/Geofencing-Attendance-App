import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  void initState() {
    super.initState();
    _polygon.add(
        Polygon(polygonId: PolygonId('1'), points: points,
          fillColor: Colors.red.withOpacity(0),
          geodesic: true,
          strokeWidth: 2,
          strokeColor: Colors.blue,
        )
    );
  }

  final Completer<GoogleMapController> _controller = Completer();

  CameraPosition _GHRCE = CameraPosition(
    target: LatLng(22.288776060376044, 73.36369436582574),
    zoom: 24,
  );

  final List<Marker> _marker = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(22.288776060376044, 73.36369436582574),
      infoWindow: InfoWindow(
        title: 'Reading Hall',
      ),
    ),
  ];

  final Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [
    const LatLng(22.288844592906457, 73.36365257319257),
    const LatLng(22.288832183886324, 73.36377796646488),
    const LatLng(22.288708093624617, 73.36377863701715),
    const LatLng(22.28870499136666, 73.3637357216726),
    const LatLng(22.288651012067227, 73.36372700449324),
    const LatLng(22.288732911685784, 73.36363782104289),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        mapType: MapType.normal,
        initialCameraPosition: _GHRCE,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        polygons: _polygon,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
