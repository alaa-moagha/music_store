import 'package:flutter/material.dart';
import 'package:music_store/ui/shared/custom_widgets/artists_list_widget.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:music_store/ui/views/all_artists_view/all_artists_controller.dart';

class AllArtistsView extends StatefulWidget {
  AllArtistsView({Key? key}) : super(key: key);

  @override
  State<AllArtistsView> createState() => _AllArtistsViewState();
}

class _AllArtistsViewState extends State<AllArtistsView> {
  AllArtistsController controller = Get.put(AllArtistsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(screenWidth(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(30)),
                child: Text(
                  "All Artists",
                  style: TextStyle(
                    fontSize: screenWidth(14),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: screenWidth(20),
              ),
              Obx(() {
                return Expanded(
                  child: controller.artistsList.isEmpty
                      ? Text('No Artists..')
                      : ArtistsListWidget(
                          artistsList: controller.artistsList,
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
