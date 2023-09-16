import 'package:flutter/material.dart';
import 'package:heavy_metals/constant.dart';

class HeavyMetalsDropdown extends StatefulWidget {
  const HeavyMetalsDropdown({super.key});

  @override
  _HeavyMetalsDropdownState createState() => _HeavyMetalsDropdownState();
}

class _HeavyMetalsDropdownState extends State<HeavyMetalsDropdown> {
  String selectedMetal = "Lead";
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
                selectedMetal = newValue ?? "Lead";
              });
            },
            items: metals.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    const Icon(Icons.category_outlined, color: kPrimaryColor),
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
