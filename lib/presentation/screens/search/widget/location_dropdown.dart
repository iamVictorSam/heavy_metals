import 'package:flutter/material.dart';
import 'package:heavy_metals/constant.dart';

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
