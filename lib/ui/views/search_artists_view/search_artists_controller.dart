import 'package:flutter/material.dart';
import 'package:music_store/core/data/models/apis/artist_model.dart';
import 'package:music_store/core/services/base_controller.dart';
import 'package:get/get.dart';
import 'package:music_store/ui/shared/utils.dart';

class SearchArtistsController extends BaseController {
  RxList<ArtistModel> artistsList = storage.getArtistsList().obs;
  RxList<ArtistModel> filteredArtistsList = RxList<ArtistModel>();

  TextEditingController searchController = TextEditingController();
  RxBool showClearButton = false.obs;

  @override
  void onInit() {
    filterArtistsList("");
    super.onInit();
  }

  void filterArtistsList(String query) {
    if (query.isEmpty) {
      filteredArtistsList.value = artistsList;
    } else {
      filteredArtistsList.value = artistsList
          .where((artist) =>
              artist.firstName!.toLowerCase().contains(query.toLowerCase()) ||
              artist.lastName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
