import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_button.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:music_store/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:get/get.dart';
import '../../../shared/colors.dart';
import '../../../shared/utils.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth(30)),
            child: Text(
              "Cart",
              style: TextStyle(
                fontSize: screenWidth(14),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          controller.cartList.isEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Cart is Empty  ",
                      style: TextStyle(fontSize: screenWidth(20)),
                    ),
                    Icon(
                      Icons.sentiment_dissatisfied_outlined,
                      color: AppColors.mainDarkBlueColor,
                    )
                  ],
                )
              : Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.cartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth(5)),
                        child: Container(
                          height: screenWidth(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(screenWidth(35)),
                            border: Border.all(
                              color: AppColors.mainBorderColor,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller
                                        .cartList[index].songModel?.image ??
                                    '',
                                height: screenWidth(4),
                                width: screenWidth(6),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller
                                            .cartList[index].songModel?.title ??
                                        '',
                                    style: TextStyle(
                                        fontSize: screenWidth(25),
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    controller.cartList[index].songModel?.price
                                            .toString() ??
                                        '',
                                    style: TextStyle(fontSize: screenWidth(25)),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () => controller
                                    .removeFromCart(controller.cartList[index]),
                                child: SvgPicture.asset(
                                  'images/delete.svg',
                                  color: AppColors.mainRedColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: screenWidth(1),
                        height: screenWidth(50),
                      );
                    },
                  ),
                ),
          SizedBox(
            height: screenWidth(50),
          ),
          if (controller.cartList.isEmpty) Spacer(),
          Form(
            key: controller.formKey,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.transparentColor,
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: AppColors.mainDarkBlueColor, width: 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sub Total:   ${cartService.subTotal.value.toPrecision(2)}  SP",
                        style: TextStyle(
                            fontSize: screenWidth(25),
                            color: AppColors.mainBlackColor,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: screenWidth(50),
                      ),
                      Text(
                        "Tax:  ${cartService.tax.value.toPrecision(2)}  SP",
                        style: TextStyle(
                            fontSize: screenWidth(25),
                            color: AppColors.mainBlackColor,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: screenWidth(50),
                      ),
                      Text(
                        "Dilevery Fees:  ${cartService.delivery.value.toPrecision(2)}  SP",
                        style: TextStyle(
                            fontSize: screenWidth(25),
                            color: AppColors.mainBlackColor,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: screenWidth(50),
                      ),
                      Text(
                        "Total:  ${cartService.total.value.toPrecision(2)}  SP",
                        style: TextStyle(
                            fontSize: screenWidth(25),
                            color: AppColors.mainRedColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Container(
                    width: screenWidth(2.1),
                    child: customtextfield(
                      Controller: controller.cardNumController,
                      hintText: "Credit Card Num",
                      hPadSize: screenWidth(25),
                      vPadSize: screenWidth(45),
                      validator: (value) {
                        return (value!.isEmpty) ? "enter number" : null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenWidth(40),
          ),
          CustomButton(
            text: "Place Order",
            onPressed: () {
              controller.updateSongsIds();
              controller.checkout();
            },
            backgroundColor: AppColors.mainDarkBlueColor,
            widthSize: screenWidth(1),
            textSize: screenWidth(20),
          ),
          SizedBox(
            height: screenWidth(40),
          ),
          InkWell(
            onTap: () => controller.clearCart(),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Empty Cart",
                style: TextStyle(
                    color: AppColors.mainRedColor,
                    fontSize: screenWidth(26),
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          SizedBox(
            height: screenWidth(40),
          ),
        ],
      );
    })));
  }
}
