import 'package:flutter/material.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/add_song_view/add_song_controller.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';

class AddSongView extends StatefulWidget {
  AddSongView({Key? key}) : super(key: key);

  @override
  State<AddSongView> createState() => _Singup2ViewState();
}

class _Singup2ViewState extends State<AddSongView> {
  AddSongController controller = AddSongController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(30),
                ),
                child: Text(
                  'Add New Song',
                  style: TextStyle(
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth(12)),
                ),
              ),
              customtextfield(
                Controller: controller.titleController,
                hintText: "title",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.typeController,
                hintText: "type",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.priceController,
                hintText: "price",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.artistIdController,
                hintText: "artist_id",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              CustomButton(
                  text: "Add Song",
                  onPressed: () async {
                    controller.addSong();
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
