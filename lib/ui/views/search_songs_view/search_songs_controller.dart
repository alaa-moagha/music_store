import 'package:flutter/material.dart';
import 'package:music_store/core/services/base_controller.dart';
import 'package:get/get.dart';
import '../../../core/data/models/apis/song_model.dart';
import '../../shared/utils.dart';

class SearchSongsController extends BaseController {
  RxList<SongModel> songsList = storage.getSongsList().obs;
  RxList<SongModel> filteredSongsList = RxList<SongModel>();

  TextEditingController searchController = TextEditingController();
  RxBool showClearButton = false.obs;

  @override
  void onInit() {
    filterSongList("");

    super.onInit();
  }

  void filterSongList(String query) {
    if (query.isEmpty) {
      filteredSongsList.value = songsList;
    } else {
      filteredSongsList.value = songsList
          .where(
              (song) => song.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
