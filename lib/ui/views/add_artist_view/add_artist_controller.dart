import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_store/core/data/repositories/add_artist_repository.dart';
import 'package:music_store/core/enums/bottom_navigation.dart';
import 'package:music_store/core/enums/message_type.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_toast.dart';
import 'package:music_store/ui/views/main_view/main_view.dart';
import '../../../core/services/base_controller.dart';

class AddArtistController extends BaseController {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController FnameController = TextEditingController();
  final TextEditingController LnameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addArtist() {
    runLoadingFutureFunction(
      function: AddArtistRepository()
          .addArtist(
              country: countryController.text,
              firstName: FnameController.text,
              gender: genderController.text,
              lastName: LnameController.text)
          .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          CustomToast.showMessage(
              message: "Artist Added Successfully\n Artist ID: " + '${r.id}',
              messageType: MessageType.SUCCESS);
          Get.off(MainView(
            pageNumber: 1,
            selectedItem: BottomNavigationEnum.HOME,
          ));
        });
      }),
    );
  }
}
