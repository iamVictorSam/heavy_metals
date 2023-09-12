import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:heavy_metals/constant.dart';
import 'package:heavy_metals/presentation/screens/articlesList/articlesList.dart';
import 'package:heavy_metals/presentation/screens/search/widget/heavy_metal_dropdown.dart';
import 'package:heavy_metals/presentation/widgets/def_btn.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
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
    );
  }
}

class LocationDropdown extends StatefulWidget {
  const LocationDropdown({super.key});

  @override
  _LocationDropdownState createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  String? selectedMetal;
  List<String> metals = ['Lead', 'Mercury', 'Cadmium', 'Arsenic', 'Chromium'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: Container(),
            value: selectedMetal,
            onChanged: (String? newValue) {
              setState(() {
                selectedMetal = newValue;
              });
            },
            items: metals.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: kPrimaryColor),
                    const SizedBox(width: 8),
                    Text(value),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
