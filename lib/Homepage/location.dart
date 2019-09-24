import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mycar/Global/variables.dart' as prefix0;
import 'package:mycar/Homepage/time.dart';

class Map extends StatefulWidget {
  Map({Key key}) : super(key: key);

  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  MapType _currentMapType = MapType.normal;
  //final Set<Marker> _markers = {};
  //var location = new Location();
  //LocationData currentLocation;

  GoogleMapController _controller;

  //static var currentLoc = location.getLocation();
  static LatLng _center = LatLng(0.0, 0.0);

  Set<Marker> _markers = {};
  Set<Polyline> _polyline = {};
  List<LatLng> latlng = List();
  var locs = [
    {'lat': 7.150130, 'long': 3.346030},
    {'lat': 7.183330, 'long': 3.283330},
    {'lat': 7.1463376, 'long': 3.37428499}
  ];
  //LatLng _lastMapPosition = _center;

  static double _scale = 11.0;
  //double _previousScale = _scale;

  zoomIn() {
    _controller.animateCamera(CameraUpdate.zoomIn());
    /* setState(() {
      _scale = _scale + 1;
    });
    print(_scale); */
  }

  zoomOut() {
    _controller.animateCamera(CameraUpdate.zoomOut());
    /* setState(() {
      _scale = _scale - 1;
    });
    print(_scale); */
  }

  /* getLocation() async {
    currentLocation = await location.getLocation();
    return LatLng(currentLocation.latitude, currentLocation.longitude);
  } */

  setLocationToMarker() {
    _controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(locs[0]['lat'], locs[0]['long']), _scale));
  }

  defaultPolines() {
    setState(() {
      _polyline.add(Polyline(
        polylineId: PolylineId(latlng.toString()),
        visible: true,
        //latlng is List<LatLng>
        points: latlng,
        color: prefix0.primaryColor,
        width: 3,
      ));
    });
  }

  joinUnjoin() {
    if (_polyline.length > 0) {
      setState(() {
        _polyline = {};
      });
    } else {
      setState(() {
        defaultPolines();
      });
    }
    print(_polyline);
    //print(latlng);
    //_polyline != null ? set _polyline = {} : defaultPolines();
  }

  defaultMarker() {
    setState(() {
      locs.forEach((loc) {
        var pos = LatLng(loc['lat'], loc['long']);
        _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(pos.toString()),
          position: pos,
          /* infoWindow: InfoWindow(
            title: 'Really cool place ',
            snippet: '5 Star Rating ',
          ), */
          icon: BitmapDescriptor.defaultMarker,
        ));
        latlng.add(pos);
      });
    });
    //print(_markers);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    defaultMarker();
    defaultPolines();
    Future.delayed(Duration(milliseconds: 1000), () {
      setLocationToMarker();
      /* getLocation().then((loc) {
        //print(loc);
        _controller.animateCamera(CameraUpdate.newLatLngZoom(loc, _scale));
      }); */

      //print(_markers);
    });
    /* location.onLocationChanged().listen((LocationData currentLocation) {
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      setState(() {
        _center = LatLng(currentLocation.latitude, currentLocation.longitude);
      });
    }); */
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  /* void _onCameraMove(CameraPosition position) {
    //_lastMapPosition = position.target;
  } */

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            indoorViewEnabled: true,
            polylines: _polyline,
            zoomGesturesEnabled: true,
            markers: _markers,
            myLocationEnabled: true,
            //onCameraMove: _onCameraMove,
            mapType: _currentMapType,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: _scale,
            ),
          ),
          Positioned(
            top: 70.00,
            right: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: FloatingActionButton(
                      onPressed: () => _onMapTypeButtonPressed(),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: prefix0.primaryColor,
                      child: const Icon(Icons.map,
                          size: 36.0, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      height: 35.00,
                      child: FloatingActionButton(
                        onPressed: () => zoomIn(),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: prefix0.primaryColor,
                        child: const Icon(Icons.zoom_in,
                            size: 15.0, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      height: 35.00,
                      child: FloatingActionButton(
                        onPressed: () => zoomOut(),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: prefix0.primaryColor,
                        child: const Icon(Icons.zoom_out,
                            size: 15.0, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Container(
                      height: 35.00,
                      child: FloatingActionButton(
                        onPressed: () => joinUnjoin(),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: prefix0.primaryColor,
                        child: const Icon(Icons.timeline,
                            size: 15.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
