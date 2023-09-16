import 'package:flutter/material.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          ArticleCard(),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://res.cloudinary.com/iamvictorsam/image/upload/v1675709306/image_d27rcg.png'),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Column(
          children: [
            const Text(
              'socio-economic Baseline for lead impacted communities in Ogoniland',
            ),
            const SizedBox(height: 5),
            Text(
              'socio-economic Baseline for lead impacted communities in Ogoniland',
              style: TextStyle(
                fontSize: 12,
                color: const Color(0xff111111).withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ],
    );
  }
}
