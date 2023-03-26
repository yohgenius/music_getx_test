import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_test/model/music_model.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constants.dart';

class SearchController extends GetxController{
MusicModel? musicModel;

var isDataLoading = false.obs;
Rx<List<dynamic>?> foundSongs = Rx<List<dynamic>>([]);
var lstSongs = List<dynamic>.empty(growable: true).obs;
TextEditingController searchController = TextEditingController();

@override
Future<void> onInit() async {
  super.onInit();
}

  getApiMusic(String keyword) async{
    try {
      isDataLoading(true);
      http.Response response = await http
          .post(Uri.tryParse('${apiLink}search?term=$keyword&entity=musicTrack')!, headers: {
        'Connection': 'Keep-Alive',
      });
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        musicModel = MusicModel.fromJson(result);
        lstSongs.clear();
        lstSongs.addAll(result['results']);
      } else {
        ///error
      }
    } catch (e) {
      print('Error getting data is $e');
    } finally {
      isDataLoading(false);
    }}
}