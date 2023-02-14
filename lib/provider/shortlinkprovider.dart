import 'dart:convert';
import 'dart:developer';

import 'package:activelamp/model/shortlinkModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/services.dart';

final shortLinker = ChangeNotifierProvider((ref) => Shortener());

class Shortener extends ChangeNotifier {
  
  final TextEditingController inputLonglinkDick = TextEditingController(),
  aliasnameunique = TextEditingController();
  String currentgeneratdLink = "";


  generateShortDickLink() async {
   
    log({
        "url":
            inputLonglinkDick.text,
        "domain": "tiny.one",
        "alias": aliasnameunique
      }.toString())
;    try {
      final result = await ApiServiceShortener.shortenLink(data: {
        "url":
            inputLonglinkDick.text,
        "domain": "tiny.one",
        "alias": aliasnameunique.text
      });
      log(jsonEncode(result.data).toString());
      if(result.statusCode == 200){
        
        final data = ShortLinkModels.fromJson(result.data);
        currentgeneratdLink = data.data.tinyUrl;
        notifyListeners();
      }
    } on DioError catch (e) {
      log(e.response!.data.toString());
    }



  }

  Future<void> launchInBrowser() async {
    if (!await launchUrl(
      Uri.parse(currentgeneratdLink),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch');
    }
  }
}
