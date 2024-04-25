import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_store/core/data/repositories/add_song_repository.dart';
import 'package:music_store/core/enums/bottom_navigation.dart';
import 'package:music_store/core/enums/message_type.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_toast.dart';
import 'package:music_store/ui/views/main_view/main_view.dart';
import '../../../core/services/base_controller.dart';

class AddSongController extends BaseController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController artistIdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addSong() {
    runLoadingFutureFunction(
      function: AddSongRepository()
          .addSong(
              artistId: artistIdController.text,
              price: priceController.text,
              title: titleController.text,
              type: typeController.text)
          .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          CustomToast.showMessage(
              message: "Song Added Successfully",
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
