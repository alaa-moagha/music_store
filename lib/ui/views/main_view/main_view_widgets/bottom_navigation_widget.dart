import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:get/get.dart';
import '../../../../core/enums/bottom_navigation.dart';
import '../../../shared/colors.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int) onTap;
  BottomNavigationWidget(
      {Key? key, required this.bottomNavigation, required this.onTap})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  RxBool showCartCount = (cartService.cartCount != 0).obs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: screenWidth(1),
          height: screenWidth(8),
          decoration: BoxDecoration(
            color: AppColors.mainWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 12,
                  offset: Offset(0, 8),
                  color: AppColors.mainTextColor)
            ],
          ),
        ),
        Positioned(
          bottom: screenWidth(40),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(20),
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  navItem(
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.PRODUCTS, 0);
                      },
                      size: Get.size,
                      imageName: 'search',
                      isSelected: widget.bottomNavigation ==
                          BottomNavigationEnum.PRODUCTS),
                  SizedBox(
                    width: screenWidth(4),
                  ),
                  navItem(
                      onTap: () {
                        widget.onTap(BottomNavigationEnum.HOME, 1);
                      },
                      size: Get.size,
                      imageName: 'home',
                      isSelected:
                          widget.bottomNavigation == BottomNavigationEnum.HOME),
                  SizedBox(
                    width: screenWidth(4),
                  ),
                  //* Cart icons number
                  Stack(
                    children: [
                      navItem(
                          onTap: () {
                            widget.onTap(BottomNavigationEnum.CART, 2);
                          },
                          size: Get.size,
                          imageName: 'cart',
                          isSelected: widget.bottomNavigation ==
                              BottomNavigationEnum.CART),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: screenWidth(25), top: screenWidth(25)),
                        child: Visibility(
                          visible: showCartCount.value,
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth(28),
                            height: screenWidth(28),
                            decoration: BoxDecoration(
                              color: AppColors.mainRedColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              cartService.cartCount.toString(),
                              style: TextStyle(
                                color: AppColors.mainWhiteColor,
                                fontSize: screenWidth(34),
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem(
      {required Size size,
      required String imageName,
      required bool isSelected,
      required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'images/$imageName.svg',
            width: isSelected ? screenWidth(13) : screenWidth(14),
            color: isSelected
                ? AppColors.mainDarkBlueColor
                : AppColors.mainBlackColor,
          ),
        ],
      ),
    );
  }
}
