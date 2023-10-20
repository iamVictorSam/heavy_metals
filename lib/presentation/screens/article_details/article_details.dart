import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:heavy_metals/presentation/screens/search/search.dart';

// ignore: must_be_immutable
class ArticleDetails extends StatelessWidget {
  ArticleDetails({Key? key}) : super(key: key);

  Color greyColor = const Color(0xff84828D);
  Color textGrey = const Color(0xff111111).withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.off(() => SearchScreen());
              },
              icon: const Icon(EvaIcons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Socio-economic Baseline for lead impacted communities in Ogoniland',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 12,
                  ),
                  const SizedBox(width: 8),
                  const Text('Mr Fred Asuquo', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 24),
                  // const Spacer(),
                  Text('Dec 5, 2001',
                      style: TextStyle(fontSize: 10, color: greyColor)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                // width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://res.cloudinary.com/iamvictorsam/image/upload/v1675709306/image_d27rcg.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Abstract',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'socio-economic Baseline for lead impacted communities in Ogoniland Ogoniland did not necessarily play a prominent role in the transatlantic slave trade, and there is little evidence to suggest that Ogoni were enslaved. When the British entered Nigeria and imposed colonial rule in 1885, they left the Ogoni in relative isolation. Despite indigenous resistance',
                style: TextStyle(color: textGrey),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Abstract',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'socio-economic Baseline for lead impacted communities in Ogoniland Ogoniland did not necessarily play a prominent role in the transatlantic slave trade, and there is little evidence to suggest that Ogoni were enslaved. When the British entered Nigeria and imposed colonial rule in 1885, they left the Ogoni in relative isolation. Despite indigenous resistance socio-economic Baselin for lead impacted communities in Ogoniland Ogoniland did not necessarily play a prominent role in the transatlantic slave trade, and there is little evidence to suggest that Ogoni were enslaved. When the British entered Nigeria and imposed colonial rule in 1885, they left the Ogoni in relative isolation. Despite indigenous resistancesocio-economic Baselin for lead impacted communities in Ogoniland Ogoniland did not necessarily play a prominent role in the transatlantic slave trade, and there is little evidence to suggest that Ogoni were enslaved. When the British entered Nigeria and imposed colonial rule in 1885, they left the Ogoni in relative isolation. Despite indigenous resistancesocio-economic Baselin for lead impacted communities in Ogoniland Ogoniland did not necessarily play a prominent role in the transatlantic slave trade, and there is little evidence to suggest that Ogoni were enslaved. When the British entered Nigeria and imposed colonial rule in 1885, they left the Ogoni in relative isolation. Despite indigenous resistance',
                style: TextStyle(color: textGrey),
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
