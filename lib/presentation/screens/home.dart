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
        town: _homeController.metals[3].text ?? "0",
        cd: _homeController.metals[3].cd ?? "0",
        pb: _homeController.metals[3].pb ?? '0',
        ni: _homeController.metals[3].ni ?? '0',
        cr: _homeController.metals[3].cr ?? '0',
        hg: _homeController.metals[3].hg ?? '0',
        zn: _homeController.metals[3].zn ?? '0'),
    // eleme
    buildPin(const LatLng(4.7994, 7.1198),
        cd: _homeController.metals[0].cd ?? '0',
        town: _homeController.metals[0].text ?? '0',
        pb: _homeController.metals[0].pb ?? '0',
        ni: _homeController.metals[0].ni ?? '0',
        cr: _homeController.metals[0].cr ?? '0',
        hg: _homeController.metals[0].hg ?? '0',
        zn: _homeController.metals[0].zn ?? '0'),
    // khana
    buildPin(const LatLng(4.6476, 7.3949),
        town: _homeController.metals[2].text ?? '0',
        cd: _homeController.metals[2].cd ?? '0',
        pb: _homeController.metals[2].pb ?? '0',
        ni: _homeController.metals[2].ni ?? '0',
        cr: _homeController.metals[2].cr ?? '0',
        hg: _homeController.metals[2].hg ?? '0',
        zn: _homeController.metals[2].zn ?? '0'),
    // gokana
    buildPin(const LatLng(4.6692, 7.2869),
        cd: _homeController.metals[1].cd ?? '0',
        town: _homeController.metals[1].text ?? '0',
        pb: _homeController.metals[1].pb ?? '0',
        ni: _homeController.metals[1].ni ?? '0',
        cr: _homeController.metals[1].cr ?? '0',
        hg: _homeController.metals[1].hg ?? '0',
        zn: _homeController.metals[1].zn ?? '0'),
  ];

  Marker buildPin(LatLng point,
      {required String? cd,
      required String? town,
      required String? pb,
      required String? ni,
      required String? hg,
      required String? cr,
      required String? zn}) {
    // Calculate the total for all metals at this location
    double total = double.parse(cd ?? '0') +
        double.parse(pb ?? '0') +
        double.parse(ni ?? '0') +
        double.parse(hg ?? '0') +
        double.parse(cr ?? '0') +
        double.parse(zn ?? '0');

    // Calculate the percentage for each metal
    double cdPercentage = (double.parse(cd ?? '0') / total) * 100;
    double pbPercentage = (double.parse(pb ?? '0') / total) * 100;
    double niPercentage = (double.parse(ni ?? '0') / total) * 100;
    double hgPercentage = (double.parse(hg ?? '0') / total) * 100;
    double crPercentage = (double.parse(cr ?? '0') / total) * 100;
    double znPercentage = (double.parse(zn ?? '0') / total) * 100;

    return Marker(
      point: point,
      width: 60,
      height: 60,
      builder: (BuildContext context) {
        return Tooltip(
          triggerMode: TooltipTriggerMode.tap,
          richMessage: TextSpan(
            text: town,
            children: [
              TextSpan(text: '\nCd: ${cdPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\nPb: ${pbPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\nNi: ${niPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\nHg: ${hgPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\nCr: ${crPercentage.toStringAsFixed(2)}%'),
              TextSpan(text: '\nZn: ${znPercentage.toStringAsFixed(2)}%'),
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
