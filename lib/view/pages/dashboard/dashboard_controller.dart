import 'dart:convert';

import 'package:get/get.dart';
import 'package:music_player_test/model/music_model.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constants.dart';

class DashboardController extends GetxController{
MusicModel? musicModel;

var isDataLoading = false.obs;

@override
Future<void> onInit() async {
  super.onInit();
  getApiMusic();
}

  getApiMusic() async{
    try {
      isDataLoading(true);
      http.Response response = await http
          .post(Uri.tryParse('${apiLink}search?term=dewa&entity=musicTrack')!, headers: {
        'Connection': 'Keep-Alive',
      });
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        musicModel = MusicModel.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      print('Error getting data is $e');
    } finally {
      isDataLoading(false);
    }}
}