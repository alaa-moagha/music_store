import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/signup_view/signup_controller.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';

class SignupView extends StatefulWidget {
  SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _Singup2ViewState();
}

class _Singup2ViewState extends State<SignupView> {
  SignupController controller = SignupController();
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
                  'Sign Up',
                  style: TextStyle(
                      color: AppColors.mainBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth(12)),
                ),
              ),
              customtextfield(
                Controller: controller.emailController,
                hintText: "Email",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
                validator: (value) {
                  return (value!.isEmpty || !GetUtils.isEmail(value))
                      ? "check email"
                      : null;
                },
              ),
              customtextfield(
                Controller: controller.passwordController,
                hintText: "Password",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
                validator: (value) {
                  return (value!.isEmpty) ? "check password" : null;
                },
              ),
              customtextfield(
                Controller: controller.FnameController,
                hintText: "First Name",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.LnameController,
                hintText: "Last Name",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.UnameController,
                hintText: "User Name",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              customtextfield(
                Controller: controller.addressController,
                hintText: "Your Address",
                hPadSize: screenWidth(25),
                vPadSize: screenWidth(45),
              ),
              CustomButton(
                  text: "Sign Up",
                  onPressed: () async {
                    controller.register();
                    // Get.off(MainView(
                    //     pageNumber: 1,
                    //     selectedItem: BottomNavigationEnum.HOME));
                  }),
              Text(
                "or sign up with",
                style: TextStyle(
                    fontSize: screenWidth(25),
                    fontWeight: FontWeight.normal,
                    color: AppColors.mainTextColor),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenWidth(40), bottom: screenWidth(35)),
                child: CustomButton(
                  text: "Sign up with Facebook",
                  backgroundColor: AppColors.mainBlueColor,
                  svgName: 'Facebook',
                  onPressed: () {},
                ),
              ),
              CustomButton(
                text: "Sign up with Google",
                backgroundColor: AppColors.mainRedColor,
                svgName: 'google-plus-logo',
                onPressed: () {},
              ),
            ],
          ),
        ),
      )),
    );
  }
}
