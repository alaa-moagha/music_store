import 'package:flutter/material.dart';
import 'package:music_store/ui/shared/colors.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_button.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/login_view/login_controller.dart';
import 'package:get/get.dart';
import 'package:music_store/ui/views/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight(24),
                  ),
                  child: Text(
                    'Login',
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
                CustomButton(
                    text: "Login",
                    onPressed: () async {
                      controller.login();
                    }),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenWidth(25), bottom: screenWidth(35)),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: screenWidth(25),
                        fontWeight: FontWeight.normal,
                        color: AppColors.mainTextColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Text(
                  "login with",
                  style: TextStyle(
                      fontSize: screenWidth(25),
                      fontWeight: FontWeight.normal,
                      color: AppColors.mainTextColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenWidth(25), bottom: screenWidth(35)),
                  child: CustomButton(
                    text: "Login with Facebook",
                    backgroundColor: AppColors.mainBlueColor,
                    svgName: 'Facebook',
                    onPressed: () {},
                  ),
                ),
                CustomButton(
                  text: "Login with Google",
                  backgroundColor: AppColors.mainRedColor,
                  svgName: 'google-plus-logo',
                  onPressed: () {},
                ),
                SizedBox(height: screenWidth(35)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?  ",
                      style: TextStyle(
                          fontSize: screenWidth(25),
                          fontWeight: FontWeight.normal,
                          color: AppColors.mainTextColor),
                    ),
                    InkWell(
                      onTap: () => Get.to(SignupView()),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: screenWidth(25),
                            fontWeight: FontWeight.w700,
                            color: AppColors.mainDarkBlueColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
