import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_store/ui/views/add_artist_view/add_artist_view.dart';
import 'package:music_store/ui/views/add_song_view/add_song_view.dart';
import 'package:music_store/ui/views/all_artists_view/all_artists_view.dart';
import 'package:music_store/ui/views/main_view/home_view/home_controller.dart';
import 'package:get/get.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/songs_list_widget.dart';
import '../../../shared/utils.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(30)),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(AllArtistsView());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: AppColors.mainBorderColor, width: 1.5),
                    ),
                    backgroundColor: AppColors.mainWhiteColor,
                  ),
                  child: Text(
                    "View all artists",
                    style: TextStyle(
                      color: AppColors.mainBlackColor,
                      fontSize: screenWidth(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(30)),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(AddSongView());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: AppColors.mainBorderColor, width: 1.5),
                    ),
                    backgroundColor: AppColors.mainWhiteColor,
                  ),
                  child: Text(
                    "Add Song",
                    style: TextStyle(
                      color: AppColors.mainBlackColor,
                      fontSize: screenWidth(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(30)),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(AddArtistView());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: AppColors.mainBorderColor, width: 1.5),
                    ),
                    backgroundColor: AppColors.mainWhiteColor,
                  ),
                  child: Text(
                    "Add artist",
                    style: TextStyle(
                      color: AppColors.mainBlackColor,
                      fontSize: screenWidth(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "All Songs",
            style: TextStyle(
              fontSize: screenWidth(15),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: screenWidth(20),
          ),
          Obx(() {
            return controller.isProductLoading
                ? SpinKitCircle(
                    color: AppColors.mainDarkBlueColor,
                  )
                : Expanded(
                    child: controller.songsList.isEmpty
                        ? Text('No Songs..')
                        : SongsListWidget(
                            songsList: controller.songsList,
                          ),
                  );
          }),
        ],
      )),
    );
  }
}
