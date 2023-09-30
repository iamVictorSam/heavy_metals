import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:heavy_metals/Getx/HomeCtx.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final greyColor = const Color(0xffAAAAAA);
  final HomeController _homeController = Get.put(HomeController());

  late final customMarkers = <Marker>[
    // tai
    buildPin(const LatLng(4.7518, 7.2437),
        cd: _homeController.metals[3].cd,
        pb: _homeController.metals[3].pb,
        ni: _homeController.metals[3].ni,
        cr: _homeController.metals[3].cr,
        hg: _homeController.metals[3].hg,
        zn: _homeController.metals[3].zn),
    // eleme
    buildPin(const LatLng(4.7994, 7.1198),
        cd: _homeController.metals[0].cd,
        pb: _homeController.metals[0].pb,
        ni: _homeController.metals[0].ni,
        cr: _homeController.metals[0].cr,
        hg: _homeController.metals[0].hg,
        zn: _homeController.metals[0].zn),
    // khana
    buildPin(const LatLng(4.6476, 7.3949),
        cd: _homeController.metals[1].cd,
        pb: _homeController.metals[1].pb,
        ni: _homeController.metals[1].ni,
        cr: _homeController.metals[1].cr,
        hg: _homeController.metals[1].hg,
        zn: _homeController.metals[1].zn),
    // gokana
    buildPin(const LatLng(4.6692, 7.2869),
        cd: _homeController.metals[2].cd,
        pb: _homeController.metals[2].pb,
        ni: _homeController.metals[2].ni,
        cr: _homeController.metals[2].cr,
        hg: _homeController.metals[2].hg,
        zn: _homeController.metals[2].zn),
  ];

  Marker buildPin(LatLng point,
      {required String cd,
      required String pb,
      required String ni,
      required String hg,
      required String cr,
      required String zn}) {
    // Calculate the total for all metals at this location
    double total = double.parse(cd) +
        double.parse(pb) +
        double.parse(ni) +
        double.parse(hg) +
        double.parse(cr) +
        double.parse(zn);

    // Calculate the percentage for each metal
    double cdPercentage = (double.parse(cd) / total) * 100;
    double pbPercentage = (double.parse(pb) / total) * 100;
    double niPercentage = (double.parse(ni) / total) * 100;
    double hgPercentage = (double.parse(hg) / total) * 100;
    double crPercentage = (double.parse(cr) / total) * 100;
    double znPercentage = (double.parse(zn) / total) * 100;

    return Marker(
      point: point,
      width: 60,
      height: 60,
      builder: (BuildContext context) {
        return Tooltip(
          triggerMode: TooltipTriggerMode.tap,
          richMessage: TextSpan(
            text: '',
            children: [
              TextSpan(text: '\ncd: ${cdPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\npb: ${pbPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\nni: ${niPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\nhg: ${hgPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\ncr: ${crPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\nzn: ${znPercentage.toStringAsFixed(2)}%'),
            ],
          ),
          child: const Icon(Icons.location_pin, size: 60, color: Colors.black),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _homeController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      center: const LatLng(4.7339, 7.2300),
                      zoom: 10.3,
                    ),
                    nonRotatedChildren: const [],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: customMarkers,
                      ),
                    ],
                  ),
                  // Positioned(
                  //   top: 80,
                  //   left: 10,
                  //   right: 10,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: ListTile(
                  //       leading: Icon(
                  //         EvaIcons.search,
                  //         color: greyColor,
                  //       ),
                  //       title: const TextField(
                  //         decoration: InputDecoration(
                  //           enabled: false,
                  //           hintText: 'Search location or meta',
                  //           border: InputBorder.none,
                  //         ),
                  //       ),
                  //       trailing: GestureDetector(
                  //         onTap: () {},
                  //         child: Icon(
                  //           Icons.close,
                  //           size: 18,
                  //           color: greyColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
    );
  }
}
