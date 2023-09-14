import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(EvaIcons.search))
        ],
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
