import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_store/core/enums/message_type.dart';
import 'package:music_store/ui/shared/colors.dart';
import 'package:music_store/ui/shared/utils.dart';

class CustomToast {
  static showMessage({
    required String message,
    MessageType messageType = MessageType.INFO,
  }) {
    String imageName = 'info';
    Color shadowColor = AppColors.mainBlueColor;

    switch (messageType) {
      case MessageType.INFO:
        imageName = 'info';
        shadowColor = AppColors.mainBlueColor;
        break;
      case MessageType.WARNING:
        imageName = 'warning';
        shadowColor = AppColors.mainOrangeColor;
        break;
      case MessageType.REJECTED:
        imageName = 'rejected';
        shadowColor = AppColors.mainRedColor;
        break;
      case MessageType.SUCCESS:
        imageName = 'approved';
        shadowColor = Colors.greenAccent;
        break;

      //   default:
      //     imageName = 'info';
      //     shadowColor = AppColors.mainBlueColor;
      //     break;
    }

    BotToast.showCustomText(
        duration: Duration(seconds: 5),
        toastBuilder: (value) {
          return Container(
            width: screenWidth(2),
            height: screenWidth(5),
            decoration: BoxDecoration(
                color: AppColors.mainWhiteColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/$imageName.svg',
                  width: screenWidth(10),
                ),
                Text(
                  message,
                  style: TextStyle(fontSize: screenWidth(30)),
                ),
              ],
            ),
          );
        });
  }
}
