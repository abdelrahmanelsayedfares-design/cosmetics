import 'dart:async';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class PinLocationView extends StatefulWidget {
  const PinLocationView({super.key});

  @override
  State<PinLocationView> createState() => _PinLocationViewState();
}

class _PinLocationViewState extends State<PinLocationView> {
  Set<Marker> Markers = {
    Marker(markerId: MarkerId('1'), position: LatLng(31.048724, 31.389697)),
  };
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showMasg('الرجاء تفعيل خدمه الوصول الي الموقع');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }


    final pos = await Geolocator.getCurrentPosition();
    return await Geolocator.getCurrentPosition();
    Markers.add(
      Marker(
        markerId: MarkerId('look'),
        position: LatLng(pos.latitude, pos.longitude),
      ),
    );
    setState(() {});
    final controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(pos.latitude, pos.longitude)),
      ),
    );
    return pos;
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  final _controller = Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PinLocation')),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        markers: Markers,
        onTap: (argument) {
          Markers.add(Marker(markerId: MarkerId('look'), position: argument));
          setState(() {});
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(31.048724, 31.389697),
          zoom: 14,
        ),
      ),
    );
  }
}
