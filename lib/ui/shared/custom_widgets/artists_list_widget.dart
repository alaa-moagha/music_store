import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_store/core/data/models/apis/artist_model.dart';
import 'package:music_store/ui/views/artist_details_view/artist_details_view.dart';
import '../colors.dart';
import '../utils.dart';

class ArtistsListWidget extends StatefulWidget {
  const ArtistsListWidget({super.key, required this.artistsList});

  final List<ArtistModel> artistsList;
  @override
  State<ArtistsListWidget> createState() => _ArtistsListWidgetState();
}

class _ArtistsListWidgetState extends State<ArtistsListWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: screenWidth(1) * 1.66 / screenHeight(1),
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.artistsList.length,
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
              height: screenWidth(2.1),
              child: InkWell(
                onTap: () {
                  Get.to(ArtistDetailsView(model: widget.artistsList[index]));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(30),
                          vertical: screenWidth(30)),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        height: screenWidth(4),
                        imageUrl: widget.artistsList[index].image ?? '',
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(50),
                      ),
                      child: Text(
                        maxLines: 2,
                        (widget.artistsList[index].firstName ?? '') +
                            " " +
                            (widget.artistsList[index].lastName ?? ''),
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
                            "Country: ",
                            style: TextStyle(
                                fontSize: screenWidth(25),
                                fontWeight: FontWeight.w700,
                                color: AppColors.mainBlueColor),
                          ),
                          Text(
                            widget.artistsList[index].country ?? '',
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
