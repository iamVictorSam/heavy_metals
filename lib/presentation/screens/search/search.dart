import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:heavy_metals/Getx/HomeCtx.dart';
import 'package:heavy_metals/constant.dart';
import 'package:heavy_metals/presentation/screens/articlesList/articlesList.dart';
import 'package:heavy_metals/presentation/screens/search/widget/heavy_metal_dropdown.dart';
import 'package:heavy_metals/presentation/screens/search/widget/location_dropdown.dart';
import 'package:heavy_metals/presentation/widgets/def_btn.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search location',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE8E8E8)),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                trailing: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ...List.generate(
                  _homeController.metals.length,
                  (index) => ListTile(
                        title: Text(_homeController.metals[index].cd),
                      )),
              const HeavyMetalsDropdown(),
              const SizedBox(
                height: 30,
              ),
              const LocationDropdown(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DefaultBtn(
                  press: () {
                    Get.to(() => const ArticleListScreen());
                  },
                  text: 'Search',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
