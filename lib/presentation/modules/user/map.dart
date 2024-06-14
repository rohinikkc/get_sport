import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/locatoion.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});
  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: DbController().getAllLocation(),
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child:  CircularProgressIndicator());
            }

            List<LocationModel>listOfmodel=snapshot.data!.docs.map((e) => LocationModel.fromjson(e.data() as Map<String,dynamic>),).toList()
;            return OSMFlutter(
  
                controller: controller,
                osmOption: OSMOption(
                 zoomOption:  ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
            ),

                  staticPoints: [
                    StaticPositionGeoPoint(
                        "1",
                        const MarkerIcon(
                          icon: Icon(Icons.location_city,color: Colors.amber,
                          
                          size: 30,
                          ),
                        ),
                        listOfmodel.map((e) => GeoPoint(latitude: e.lat, longitude:e.lon)).toList())
                  ],
                  userTrackingOption: const UserTrackingOption(
                    enableTracking: true,
                    unFollowUser: false,
                  ),
                ));
          }
        ));
  }
}
