import 'package:flutter/material.dart';
import 'package:music_store/ui/shared/custom_widgets/artists_list_widget.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/search_artists_view/search_artists_controller.dart';
import 'package:get/get.dart';

class SearchArtistsView extends StatefulWidget {
  SearchArtistsView({Key? key}) : super(key: key);

  @override
  State<SearchArtistsView> createState() => _SearchArtistsViewState();
}

class _SearchArtistsViewState extends State<SearchArtistsView> {
  SearchArtistsController controller = Get.put(SearchArtistsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Padding(
            padding: EdgeInsets.all(screenWidth(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.searchController,
                  onChanged: (searchQuery) {
                    controller.showClearButton.value = searchQuery.isNotEmpty;
                    controller.filterArtistsList(searchQuery);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: controller.showClearButton.value
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              controller.searchController.clear();
                              controller.filterArtistsList("");
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
                  child: controller.filteredArtistsList.isEmpty
                      ? Text('No Match.. :(')
                      : ArtistsListWidget(
                          artistsList: controller.filteredArtistsList,
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
