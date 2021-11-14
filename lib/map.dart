import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'seven_discount.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('sample_7-11安和門市'),
          position: LatLng(22.73093119035532, 120.29217589720932),
          infoWindow: InfoWindow(
            title: '7-11安和門市',
            snippet: '[活動一:刷卡滿額贈\n[]活動二:刷卡回饋]',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => seven_discount(),
                      maintainState: false));
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: LatLng(22.734845444899037, 120.2841425522054),
                zoom: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
