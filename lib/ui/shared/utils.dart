import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:music_store/core/data/repositories/shared_preference_repository.dart';
import 'package:music_store/ui/shared/colors.dart';
import 'package:get/get.dart';
import '../../core/services/cart_service.dart';

double screenWidth(double percent) {
  return Get.size.width / percent;
}

double screenHeight(double percent) {
  return Get.size.height / percent;
}

SharedPreferenceRepository get storage => Get.find();

CartService get cartService => Get.find();

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return SpinKitCircle(
        color: AppColors.mainDarkBlueColor,
        size: screenWidth(7),
      );
    });

double get taxAmount => 0.18;

double get deliveryAmount => 0.1;
