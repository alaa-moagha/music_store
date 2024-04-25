import 'package:flutter/material.dart';
import 'package:music_store/core/data/repositories/create_invoice_repository.dart';
import 'package:music_store/core/enums/message_type.dart';
import 'package:music_store/ui/shared/custom_widgets/custom_toast.dart';
import 'package:music_store/ui/views/checkout_view/checkout_view.dart';
import 'package:get/get.dart';
import '../../../../core/data/models/cart_model.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/utils.dart';

class CartController extends BaseController {
  List<CartModel> cartList = <CartModel>[];
  final TextEditingController cardNumController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<int> ids = [];

  @override
  void onInit() {
    cartList = cartService.cartList;
    cartService.calcTotals();

    super.onInit();
  }

  void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

  void clearCart() {
    cartService.clearCart();
  }

  void updateSongsIds() {
    if (cartList.isNotEmpty) {
      ids.clear();
      cartList.forEach((element) {
        ids.addAll([element.songModel!.id!]);
      });
    } else
      ids = [];
  }

  void checkout() {
    runFullLoadingFutureFunction(
      function: Future.delayed(Duration(seconds: 2)).then((value) => {
            CreateInvoiceRepository().createInvoice(
                creditCard: cardNumController.text, songIds: ids),
            Get.off(CheckoutView()),
            cardNumController.clear(),
            CustomToast.showMessage(
                message: "Order Placed Successfully",
                messageType: MessageType.SUCCESS),
          }),
    );
  }
}
