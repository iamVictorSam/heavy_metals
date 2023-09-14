import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ArticleCard extends StatelessWidget {
  ArticleCard({
    super.key,
  });

  Color greyColor = const Color(0xff84828D);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(-4.0, -4.0),
            blurRadius: 7.0,
          ),
          BoxShadow(
            color: Colors.grey[300]!,
            offset: const Offset(4.0, 4.0),
            blurRadius: 7.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://res.cloudinary.com/iamvictorsam/image/upload/v1675709306/image_d27rcg.png'),
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Socio-economic Baseline for lead impacted communities in Ogoniland',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  'Socio-economic Baseline for lead impacted communities in Ogoniland',
                  style: TextStyle(
                    fontSize: 11,
                    color: const Color(0xff111111).withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 8,
                    ),
                    const SizedBox(width: 8),
                    const Text('Mr Fred Asuquo',
                        style: TextStyle(fontSize: 10)),
                    // SizedBox(width: 8),
                    const Spacer(),
                    Text('Dec 5, 2001',
                        style: TextStyle(fontSize: 8, color: greyColor)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
