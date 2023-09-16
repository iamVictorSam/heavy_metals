import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heavy_metals/constant.dart';

class DefaultBtn extends StatelessWidget {
  final Color color, textColor;
  final String text;
  final Function() press;
  const DefaultBtn(
      {Key? key,
      this.color = kPrimaryColor,
      this.textColor = kWhite,
      this.text = 'text',
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w600, fontSize: 16)),
        ),
      ),
    );
  }
}
