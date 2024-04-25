import 'package:music_store/core/services/base_controller.dart';
import 'package:music_store/ui/shared/utils.dart';
import '../../../core/data/models/cart_model.dart';

class CheckoutController extends BaseController {
  List<CartModel> cartList = <CartModel>[];
  @override
  void onInit() {
    cartList = cartService.cartList;
    super.onInit();
  }

  @override
  void onClose() {
    cartService.clearCart();

    super.onClose();
  }
}
