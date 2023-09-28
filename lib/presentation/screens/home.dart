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
        cd: '49', pb: '53', ni: '43', cr: '68', hg: '38', zn: '60'),
    // eleme
    buildPin(const LatLng(4.7994, 7.1198),
        cd: '49', pb: '53', ni: '43', cr: '68', hg: '38', zn: '60'),
    // khana
    buildPin(const LatLng(4.6476, 7.3949),
        cd: '49', pb: '53', ni: '43', cr: '68', hg: '38', zn: '60'),
    // gokana
    buildPin(const LatLng(4.6692, 7.2869),
        cd: '49', pb: '53', ni: '43', cr: '68', hg: '38', zn: '60'),
  ];

  Marker buildPin(LatLng point,
          {required String cd,
          required String pb,
          required String ni,
          required String hg,
          required String cr,
          required String zn}) =>
      Marker(
        point: point,
        width: 60,
        height: 60,
        builder: (BuildContext context) {
          return Obx(
            () => Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              richMessage: TextSpan(
                text: '',
                children: [
                  TextSpan(text: '\ncd: ${_homeController.metals[4].cd}'),
                  TextSpan(text: '\npb: $pb'),
                  TextSpan(text: '\nni: $ni'),
                  TextSpan(text: '\nhg: $hg'),
                  TextSpan(text: '\ncr: $cr'),
                  TextSpan(text: '\nzn: $zn'),
                ],
              ),
              child:
                  const Icon(Icons.location_pin, size: 60, color: Colors.black),
            ),
          );
        },
      );

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
