import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_store/core/data/repositories/user_repository.dart';
import 'package:music_store/core/enums/bottom_navigation.dart';
import 'package:music_store/core/enums/message_type.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_toast.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/main_view/main_view.dart';

import '../../../core/services/base_controller.dart';

class SignupController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController FnameController = TextEditingController();
  final TextEditingController LnameController = TextEditingController();
  final TextEditingController UnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void register() {
    runLoadingFutureFunction(
      function: UserRepository()
          .register(
              email: emailController.text,
              password: passwordController.text,
              address: addressController.text,
              firstname: FnameController.text,
              lastname: LnameController.text,
              userName: UnameController.text)
          .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          storage.setIsLogined(true);
          Get.offAll(MainView(
            pageNumber: 1,
            selectedItem: BottomNavigationEnum.HOME,
          ));
        });
      }),
    );
  }
}
