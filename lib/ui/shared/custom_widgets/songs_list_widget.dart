import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/models/apis/song_model.dart';
import '../../views/song_details_view/song_details_view.dart';
import '../colors.dart';
import '../utils.dart';

class SongsListWidget extends StatefulWidget {
  const SongsListWidget({super.key, required this.songsList});

  final List<SongModel> songsList;
  @override
  State<SongsListWidget> createState() => _SongsListWidgetState();
}

class _SongsListWidgetState extends State<SongsListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: screenWidth(1) * 1.6 / screenHeight(1),
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.songsList.length,
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
              child: InkWell(
                onTap: () {
                  Get.to(SongDetailsView(model: widget.songsList[index]));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(30),
                          vertical: screenWidth(35)),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        height: screenWidth(3.5),
                        imageUrl: widget.songsList[index].image ?? '',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(30),
                      ),
                      child: Text(
                        maxLines: 2,
                        widget.songsList[index].title ?? '',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Price: ",
                            style: TextStyle(
                                fontSize: screenWidth(25),
                                fontWeight: FontWeight.w700,
                                color: AppColors.mainBlueColor),
                          ),
                          Text(
                            widget.songsList[index].price.toString(),
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
            ),
          ],
        );
      },
    );
  }
}
