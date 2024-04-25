import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_button.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/search_songs_view/search_songs_view.dart';
import 'package:music_store/ui/views/search_artists_view/search_artists_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(screenWidth(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  text: 'Search for Songs',
                  onPressed: () => Get.to(SearchSongsView())),
              SizedBox(
                height: screenWidth(30),
              ),
              CustomButton(
                  text: 'Search for Artists',
                  onPressed: () => Get.to(SearchArtistsView())),
            ],
          ),
        ),
      ),
    );
  }
}
