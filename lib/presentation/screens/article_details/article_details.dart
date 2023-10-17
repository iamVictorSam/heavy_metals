import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class ArticleDetails extends StatelessWidget {
  ArticleDetails({Key? key}) : super(key: key);

  Color greyColor = const Color(0xff84828D);
  Color textGrey = const Color(0xff111111).withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'ToxMet®',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                const Center(
                  child: Text(
                    'By',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                buildAuthor(
                    name: 'Prof. Kingsley Chukwuemeka Patrick-Iwuanyanwu'),
                buildAuthor(name: 'Sam Neebee Victor'),
                buildAuthor(name: 'Ikechi Fortune Kelechi'),

                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: 200,
                //   // width: 80,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     image: const DecorationImage(
                //       fit: BoxFit.cover,
                //       image: NetworkImage(
                //           'https://res.cloudinary.com/iamvictorsam/image/upload/v1675709306/image_d27rcg.png'),
                //     ),
                //   ),
                // ),

                // const Text(
                //   'Abstract',
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                // ),
                const Text(
                  'ToxMet® Mobile Application: Prediction of Heavy Metals Concentration in Selected Impacted Communities of Ogoniland Using Machine Learning and Flutter.',
                  style: TextStyle(color: Colors.black),
                ),

                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Field of Innovation/Creativity',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Text(
                  'ToxMet® mobile application utilizes machine learning algorithms, geospatial mapping techniques, and data drawn from various research sources to detect and make informed predictions of heavy metals (Pb, Cd, Cr, Hg, Ni, Zn) pollution in soil and water within specific impacted Local Governments (Eleme, Tai, Gokana, Khana) of Rivers State, Nigeria.',
                  style: TextStyle(color: Colors.black),
                ),

                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Goal of the Innovation/Creativity',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                const Text(
                  'ToxMet® offers a novel, innovative, technology-driven approach to heavy metals pollution detection, and future predictions. providing accurate data on contamination hot spots. It also creates a visual awareness of affected communities in Ogoniland using collected data .',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Statement of the Innovation/Creativity',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Text(
                  'ToxMet® leverages Python programming and Snowflake data platform to process extensive data from research publications and online sources. The application\'s machine learning algorithms and geospatial mapping capabilities empower it to accurately predict contamination trends and identify potential hot spots. Flutter, a versatile mobile app development framework, plays a crucial role in visualizing this geospatial data and enhancing the user experience. It uses maps to display geographical locations, helping users visualize where the contamination trends are most prominent based on articles published in specific locations. Additionally, Flutter enables the application to show interactive chart readings of past, present, and future data, providing users with a comprehensive understanding of the environmental trends in Ogoniland. This integration of Flutter\'s capabilities transforms ToxMet® into a powerful and user-friendly collaborative platform, encouraging users to work together towards sustainable solutions.',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAuthor({String? image, name}) => Center(
        child: Text(name,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      );
}
