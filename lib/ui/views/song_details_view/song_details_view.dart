import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/data/models/apis/song_model.dart';
import 'package:music_store/ui/views/song_details_view/song_details_controller.dart';
import 'package:get/get.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';

class SongDetailsView extends StatefulWidget {
  final SongModel model;
  const SongDetailsView({super.key, required this.model});

  @override
  State<SongDetailsView> createState() => _SongDetailsViewState();
}

class _SongDetailsViewState extends State<SongDetailsView> {
  late SongDetailsController controller;
  @override
  void initState() {
    controller = Get.put(SongDetailsController(widget.model));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth(20)),
              child: Text(
                widget.model.title!,
                style: TextStyle(
                    fontSize: screenWidth(20), fontWeight: FontWeight.w700),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                height: screenWidth(3),
                imageUrl: widget.model.image!,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: screenWidth(20), top: screenWidth(20)),
              child: Row(
                children: [
                  Text(
                    "Type: ",
                    style: TextStyle(
                        fontSize: screenWidth(22),
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainBlueColor),
                  ),
                  Text(
                    widget.model.type!,
                    style: TextStyle(fontSize: screenWidth(25)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth(20)),
              child: Row(
                children: [
                  Text(
                    "Artist: ",
                    style: TextStyle(
                        fontSize: screenWidth(22),
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainBlueColor),
                  ),
                  Text(
                    widget.model.artist!.firstName! +
                        " " +
                        widget.model.artist!.lastName!,
                    style: TextStyle(fontSize: screenWidth(25)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: Row(
                children: [
                  Text(
                    "Price: ",
                    style: TextStyle(
                        fontSize: screenWidth(22),
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainBlueColor),
                  ),
                  Text(
                    widget.model.price!.toString(),
                    style: TextStyle(fontSize: screenWidth(25)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenWidth(1.5)),
              child: ElevatedButton(
                onPressed: () {
                  controller.addToCart();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(screenWidth(2.5), 40),
                    backgroundColor: AppColors.mainDarkBlueColor),
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: AppColors.mainWhiteColor,
                    fontSize: screenWidth(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
