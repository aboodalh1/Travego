import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:travego/features/location/manger/location_cubit.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/shared/constant.dart';

// ignore: must_be_immutable
class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});
  List<String> categories = [
    'supermarket',
    'gardens',
    'clothes',
    'vehicle',
    'anime',
    'bag',
    'food_and_drink',
    'chemist'
  ];

  final random = Random();

  late var myMarkers;

  bool isBottomSheetShown = false;

  String dropController = '';
  double selectedLon = 0;
  double selectedLat = 0;

  late CameraPosition initialCameraPosition;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LocationCubit(),
      child: BlocConsumer<LocationCubit, LocationStates>(
        listener: (context, state) {
          if (state is LocationInitState) {
            initialCameraPosition = const CameraPosition(
                zoom: 14, target: LatLng(31.187084851056554, 29.928110526889437));
          }
          if (state is LocationClosedState) {
            googleMapController.dispose();
          }
        },
        builder: (context, state) {
          var locationCubit = BlocProvider.of<LocationCubit>(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(),
            body: Stack(children: [
              GoogleMap(
                circles: locationCubit.circles,
                initialCameraPosition:
                    const CameraPosition(target: LatLng(31, 39), zoom: 4),
                // polygons: cubit.polygons,
                // markers: cubit.markers,
                onMapCreated: (controller) {
                  googleMapController = controller;
                },
                onLongPress: (LatLng location) {
                  googleMapController
                      .animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(target: location, zoom: 8.0),
                  ));
                  locationCubit.markers.add(Marker(
                      markerId: const MarkerId('1'),
                      position: LatLng(location.latitude, location.longitude)));
                  locationCubit.addMarker();
                  initCircles(
                      lat: location.latitude, long: location.longitude, context);
                  locationCubit.addMarker();
                  selectedLat = location.longitude;
                  selectedLon = location.latitude;
                },
                onTap: (LatLng location) {
                  locationCubit.markers.add(Marker(
                      markerId: const MarkerId('1'),
                      position: LatLng(location.latitude, location.longitude)));
                  locationCubit.addMarker();
                  initCircles(
                      lat: location.latitude, long: location.longitude, context);
                  locationCubit.addMarker();
                  selectedLat = location.longitude;
                  selectedLon = location.latitude;
                },
              ),
              Positioned(
                  bottom: 16,
                  left: 16,
                  right: 49,
                  child: ElevatedButton(
                    onPressed: () {
                      locationCubit.getPlaces(context,
                          categories: 'commercial.supermarket',
                          limit: '10',
                          lon: selectedLon,
                          lat: selectedLat);
                      if (!isBottomSheetShown) {
                        isBottomSheetShown = true;
                        scaffoldKey.currentState!
                            .showBottomSheet((context) {
                              return bottomSheet(context);
                            })
                            .closed
                            .then((value) {
                              isBottomSheetShown = false;
                            });
                      }
                    },
                    child: const Text("Explore Places"),
                  )),
            ]),
          );
        },
      ),
    );
  }

  Container bottomSheet(context) {
    return Container(
        color: Colors.grey[100],
        padding: const EdgeInsetsDirectional.all(30),
        width: double.infinity,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    'Explore Places',
                    style: GoogleFonts.inter(),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("done"),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: DropDownFormField(context),
              ),
            ])));
  }

  DropdownButtonFormField<String> DropDownFormField(context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        label: const Text('Category',
            style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xffAD7FDA)),
        ),
      ),
      items: categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        dropController = newValue!;
        print(dropController);
        BlocProvider.of<LocationCubit>(context).getPlaces(context,
            categories: 'commercial.$dropController',
            limit: '10',
            lon: selectedLon,
            lat: selectedLat);
      },
    );
  }

  void initMarker(context) {
    if (placeModel != null) {
      myMarkers = placeModel!.features!
          .map(
            (placeModel) => Marker(
              position: LatLng(placeModel.geometry!.coordinates![0].toDouble(),
                  placeModel.geometry!.coordinates![1].toDouble()),
              markerId: MarkerId(random.nextInt(1000).toString()),
            ),
          )
          .toSet();
      BlocProvider.of<LocationCubit>(context).markers.addAll(myMarkers);
      print('Ggg');
    }
  }

  // void initPolygones() {
  //   Polygon poly = const Polygon(
  //       polygonId: PolygonId('12'),
  //       points: [LatLng(31.149768388707795, 29.946787543594834)]);
  // }

  void initCircles(context, {required double lat, required double long}) {
    Circle Gg = Circle(
        circleId: const CircleId('312315'),
        fillColor: Colors.black.withOpacity(0.4),
        center: LatLng(lat, long),
        radius: 5000,
        visible: true);
    BlocProvider.of<LocationCubit>(context).circles.add(Gg);
  }
}

// world view 0->3
// country view 4->6
// city view 10->12
// street view 13->17
// building view 18->20

//ab030d08342b43f59d3a300e40ef1fcc