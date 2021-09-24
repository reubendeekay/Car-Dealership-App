import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/providers/location_provider.dart';
import 'package:vehicle_management/providers/property_provider.dart';
import 'package:vehicle_management/screens/home/widgets/top_search.dart';
import 'package:vehicle_management/screens/map_overview/map_search_screen.dart';
import 'package:vehicle_management/screens/property_details/property_details_screen.dart';

class MapOverviewScreen extends StatefulWidget {
  @override
  _MapOverviewScreenState createState() => _MapOverviewScreenState();
}

class _MapOverviewScreenState extends State<MapOverviewScreen> {
  GoogleMapController mapController;
  Set<Marker> _markers = {};
  BitmapDescriptor _markerIcon;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    mapController.setMapStyle(value);
    final properties =
        Provider.of<PropertyProvider>(context, listen: false).properties;

    setState(() {
      _markers.addAll(properties.map(
        (property) => Marker(
          markerId: MarkerId(property.id),
          onTap: () => Navigator.of(context)
              .pushNamed(PropertyDetailsScreen.routeName, arguments: property),
          icon: _markerIcon,
          position:
              LatLng(property.location.latitude, property.location.longitude),
          infoWindow: InfoWindow(title: property.name),
        ),
      ));
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) => setCustomMarker());

    super.initState();
  }

  void setCustomMarker() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          size: Size(5, 5),
        ),
        'assets/images/marker.png',
        mipmaps: false);
  }

  @override
  Widget build(BuildContext context) {
    var _locationData = Provider.of<LocationProvider>(context).locationData;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          //////////////////GOOGLE MAP/////////////////
          GoogleMap(
            onTap: (value) {
              print(value);
            },
            markers: _markers,
            onMapCreated: _onMapCreated,
            compassEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
                target: LatLng(_locationData.latitude, _locationData.longitude),
                zoom: 14),
          ),

          ///////////////////////HEADER ABOVE ////////////////////////////
          Container(
              height: 52,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                  // color: Color(0xFF6939DB),
                  borderRadius: BorderRadius.circular(20)),
              child: GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(MapSearchScreen.routeName),
                child: Card(
                    // color: Color(0xFF6939DB),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: [
                          const Icon(
                            Icons.search,
                            size: 22,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Search by name or location',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18)),
                        ]))),
              )),
        ],
      )),
    );
  }
}
