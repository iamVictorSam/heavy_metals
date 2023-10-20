// To parse this JSON data, do
//
//     final metalsModel = metalsModelFromJson(jsonString);

import 'dart:convert';

List<MetalsModel> metalsModelFromJson(String str) => List<MetalsModel>.from(
    json.decode(str).map((x) => MetalsModel.fromJson(x)));

class MetalsModel {
  String text;
  String cd;
  String pb;
  String ni;
  String cr;
  String hg;
  String zn;
  String eleme;
  String gokana;
  String khana;
  String tai;

  MetalsModel({
    required this.text,
    required this.cd,
    required this.pb,
    required this.ni,
    required this.cr,
    required this.hg,
    required this.zn,
    required this.eleme,
    required this.gokana,
    required this.khana,
    required this.tai,
  });

  factory MetalsModel.fromJson(Map<String, dynamic> json) => MetalsModel(
        text: json["text  "],
        cd: json["Cd"],
        pb: json["Pb"],
        ni: json["Ni"],
        cr: json["Cr"],
        hg: json["Hg"],
        zn: json["Zn"],
        eleme: json["Eleme"],
        gokana: json["Gokana"],
        khana: json["Khana"],
        tai: json["Tai"],
      );
}
