import 'package:flutter/material.dart';
import 'package:music_store/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/bottom_navigation.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../../shared/utils.dart';

class LoginController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() {
    runLoadingFutureFunction(
      function: UserRepository()
          .login(email: emailController.text, password: passwordController.text)
          .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          storage.setIsLogined(true);
          storage.setTokenInfo(r);
          Get.offAll(MainView(
            pageNumber: 1,
            selectedItem: BottomNavigationEnum.HOME,
          ));
        });
      }),
    );
  }
}
