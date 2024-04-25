import 'package:flutter/material.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/search_songs_view/search_songs_controller.dart';
import 'package:get/get.dart';
import '../../shared/custom_widgets/songs_list_widget.dart';

class SearchSongsView extends StatefulWidget {
  SearchSongsView({Key? key}) : super(key: key);

  @override
  State<SearchSongsView> createState() => _SearchSongsViewState();
}

class _SearchSongsViewState extends State<SearchSongsView> {
  SearchSongsController controller = Get.put(SearchSongsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(screenWidth(30)),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.searchController,
                  onChanged: (searchQuery) {
                    controller.showClearButton.value = searchQuery.isNotEmpty;
                    controller.filterSongList(searchQuery);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: controller.showClearButton.value
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              controller.searchController.clear();
                              controller.filterSongList("");
                              controller.showClearButton.value = false;
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth(25),
                ),
                Expanded(
                  child: controller.filteredSongsList.isEmpty
                      ? Text('No Match.. :(')
                      : SongsListWidget(
                          songsList: controller.filteredSongsList,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
