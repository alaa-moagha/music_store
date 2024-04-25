import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/data/models/apis/artist_model.dart';
import 'package:music_store/ui/views/artist_details_view/artist_details_controller.dart';
import 'package:get/get.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';

class ArtistDetailsView extends StatefulWidget {
  final ArtistModel model;
  const ArtistDetailsView({super.key, required this.model});

  @override
  State<ArtistDetailsView> createState() => _ArtistDetailsViewState();
}

class _ArtistDetailsViewState extends State<ArtistDetailsView> {
  late ArtistDetailsController controller;
  @override
  void initState() {
    controller = Get.put(ArtistDetailsController(widget.model));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth(20)),
                child: Text(
                  (widget.model.firstName ?? '') +
                      " " +
                      (widget.model.lastName ?? ''),
                  style: TextStyle(
                      fontSize: screenWidth(22), fontWeight: FontWeight.w700),
                ),
              ),
              CachedNetworkImage(
                height: screenWidth(3),
                imageUrl: widget.model.image ?? '',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth(20), top: screenWidth(20)),
                child: Row(
                  children: [
                    Text(
                      "Gender: ",
                      style: TextStyle(
                          fontSize: screenWidth(22),
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainBlueColor),
                    ),
                    Text(
                      widget.model.gender!,
                      style: TextStyle(fontSize: screenWidth(25)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth(20), top: screenWidth(20)),
                child: Row(
                  children: [
                    Text(
                      "Artist ID: ",
                      style: TextStyle(
                          fontSize: screenWidth(22),
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainBlueColor),
                    ),
                    Text(
                      widget.model.id.toString(),
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
                      "Country: ",
                      style: TextStyle(
                          fontSize: screenWidth(22),
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainBlueColor),
                    ),
                    Text(
                      widget.model.country!,
                      style: TextStyle(fontSize: screenWidth(25)),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                  child: Text(
                    "Songs: ",
                    style: TextStyle(
                        fontSize: screenWidth(22),
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainBlueColor),
                  ),
                ),
              ),
              SizedBox(
                height: screenWidth(30),
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: widget.model.songs
              //               ?.map((song) => Text(
              //                     song.title ?? '',
              //                     style: TextStyle(
              //                         fontSize: screenWidth(25),
              //                         fontWeight: FontWeight.w700),
              //                   ))
              //               .toList() ??
              //           [],
              //     ),
              //   ),
              // ),
              controller.model.songs!.isEmpty
                  ? Text('No Songs..')
                  : Container(
                      height: screenWidth(1),
                      child: GridView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              screenWidth(1) * 1.8 / screenHeight(1),
                        ),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: widget.model.songs?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.mainBorderColor,
                                    width: 2,
                                  ),
                                ),
                                width: screenWidth(2.5),
                                height: screenWidth(2),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth(30),
                                          vertical: screenWidth(35)),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.contain,
                                        height: screenWidth(3.5),
                                        imageUrl:
                                            widget.model.songs?[index].image ??
                                                '',
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth(30),
                                      ),
                                      child: Text(
                                        maxLines: 2,
                                        widget.model.songs?[index].title ?? '',
                                        textAlign: TextAlign.start,
                                        //! how text overflow is handeled
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: screenWidth(25),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth(30),
                                          vertical: screenWidth(50)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Price: ",
                                            style: TextStyle(
                                                fontSize: screenWidth(25),
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.mainBlueColor),
                                          ),
                                          Text(
                                            widget.model.songs?[index].price
                                                    .toString() ??
                                                "0",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: screenWidth(25),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
