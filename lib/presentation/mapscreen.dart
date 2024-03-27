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
          strokeWidth: 5,
          strokeColor: Colors.blue,
        )
    );
  }

  final Completer<GoogleMapController> _controller = Completer();

  CameraPosition _GHRCE = CameraPosition(
    target: LatLng(21.105087, 79.003594),
    zoom: 24,
  );

  final List<Marker> _marker = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(21.105087, 79.003594),
      infoWindow: InfoWindow(
        title: 'GHRCE',
      ),
    ),
  ];

  final Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [
    const LatLng(21.105537, 79.003043),
    const LatLng(21.105336, 79.003309),
    const LatLng(21.105300, 79.003285),
    const LatLng(21.105262, 79.003272),
    const LatLng(21.105165, 79.003344),
    const LatLng(21.104983, 79.003401),
    const LatLng(21.104703, 79.003325),
    const LatLng(21.104555, 79.003631),
    const LatLng(21.104704, 79.003770),
    const LatLng(21.104674, 79.003839),
    const LatLng(21.104396, 79.003915),
    const LatLng(21.104442, 79.004095),
    const LatLng(21.104817, 79.003998),
    const LatLng(21.104895, 79.003840),
    const LatLng(21.105063, 79.003939),
    const LatLng(21.105834, 79.003630),
    const LatLng(21.105761, 79.003148),

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
