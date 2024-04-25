import 'package:flutter/material.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_button.dart';
import 'package:music_store/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import '../../../core/enums/bottom_navigation.dart';
import '../../shared/utils.dart';
import 'checkout_controller.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  CheckoutController controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(screenWidth(25)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenWidth(5)),
                child: Text(
                  "Checkout View",
                  style: TextStyle(
                      fontSize: screenWidth(15), fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                "items count: ${cartService.getCartCount().toString()}",
                style: TextStyle(fontSize: screenWidth(20)),
              ),
              SizedBox(
                height: screenWidth(50),
              ),
              Text(
                "Sub Total: ${cartService.subTotal.value}",
                style: TextStyle(fontSize: screenWidth(20)),
              ),
              SizedBox(
                height: screenWidth(50),
              ),
              Text(
                "Tax: ${cartService.tax.value}",
                style: TextStyle(fontSize: screenWidth(20)),
              ),
              SizedBox(
                height: screenWidth(50),
              ),
              Text(
                "Delivery Fees: ${cartService.delivery.value}",
                style: TextStyle(fontSize: screenWidth(20)),
              ),
              SizedBox(
                height: screenWidth(50),
              ),
              Text(
                "Total: ${cartService.total.value}",
                style: TextStyle(fontSize: screenWidth(20)),
              ),
              SizedBox(
                height: screenWidth(20),
              ),
              CustomButton(
                  text: "Continue Shopping",
                  onPressed: () {
                    Get.off(MainView(
                      selectedItem: BottomNavigationEnum.HOME,
                      pageNumber: 1,
                    ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
