import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ArticleDetails extends StatelessWidget {
  ArticleDetails({Key? key}) : super(key: key);

  Color greyColor = const Color(0xff84828D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(EvaIcons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text(
                'Socio-economic Baseline for lead impacted communities in Ogoniland',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 8,
                  ),
                  const SizedBox(width: 8),
                  const Text('Mr Fred Asuquo', style: TextStyle(fontSize: 10)),
                  // SizedBox(width: 8),
                  const Spacer(),
                  Text('Dec 5, 2001',
                      style: TextStyle(fontSize: 8, color: greyColor)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
