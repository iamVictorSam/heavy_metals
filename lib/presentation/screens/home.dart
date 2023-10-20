import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:heavy_metals/Getx/HomeCtx.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final greyColor = const Color(0xffAAAAAA);
  // final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    // fetchData();

    // _homeController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: const LatLng(51.509364, -0.128928),
              zoom: 9.2,
            ),
            nonRotatedChildren: const [],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),
          Positioned(
            top: 80,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(
                  EvaIcons.search,
                  color: greyColor,
                ),
                title: const TextField(
                  decoration: InputDecoration(
                    enabled: false,
                    hintText: 'Search location or meta',
                    border: InputBorder.none,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: greyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
