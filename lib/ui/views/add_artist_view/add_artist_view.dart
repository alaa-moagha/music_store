import 'package:flutter/material.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/add_artist_view/add_artist_controller.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';

class AddArtistView extends StatefulWidget {
  AddArtistView({Key? key}) : super(key: key);

  @override
  State<AddArtistView> createState() => _Singup2ViewState();
}

class _Singup2ViewState extends State<AddArtistView> {
  AddArtistController controller = AddArtistController();
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
                  'Add New Artist',
                  style: TextStyle(
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth(12)),
                ),
              ),
              customtextfield(
                Controller: controller.FnameController,
                hintText: "first name",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.LnameController,
                hintText: "last name",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.genderController,
                hintText: "gender",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.countryController,
                hintText: "country",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              CustomButton(
                  text: "Add Artist",
                  onPressed: () async {
                    controller.addArtist();
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
