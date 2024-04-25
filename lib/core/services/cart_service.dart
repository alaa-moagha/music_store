import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../ui/shared/utils.dart';
import '../data/models/apis/song_model.dart';
import '../data/models/cart_model.dart';

class CartService {
  RxList<CartModel> cartList = storage.getCartList().obs;
  RxInt cartCount = 0.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble delivery = 0.0.obs;
  RxDouble total = 0.0.obs;

  CartService() {
    cartCount.value = getCartCount();
    calcTotals();
  }

  void addToCart({
    required SongModel model,
    required int count,
    Function? afterAdd,
  }) {
    if (getCartModel(model) != null) {
      int index = cartList.indexOf(getCartModel(model)!);
      cartList[index].count = cartList[index].count! + count;
      cartList[index].total = cartList[index].total! + (count * model.price!);
    } else {
      cartList.add(CartModel(
        count: count,
        total: (count * model.price!).toDouble(),
        songModel: model,
      ));
    }
    cartCount += count;
    calcTotals();
    storage.setCartList(cartList);
    if (afterAdd != null) afterAdd();
  }

  void removeFromCart({required CartModel model, Function? afterRemove}) {
    cartList.remove(model);
    calcTotals();
    storage.setCartList(cartList);
    cartCount -= model.count!;
    if (afterRemove != null) afterRemove();
  }

  CartModel? getCartModel(SongModel model) {
    try {
      return cartList.firstWhere(
        (element) => element.songModel!.id == model.id,
      );
    } catch (e) {
      return null;
    }
  }

  int getCartCount() {
    return cartList.fold(0, (sum, item) => sum + (item.count ?? 0));
  }

  void calcTotals() {
    subTotal.value = (cartList.fold(
        0.0, (sum, element) => sum + (element.total ?? 0))).toPrecision(2);
    tax.value = (subTotal.value * taxAmount).toPrecision(2);
    delivery.value =
        ((subTotal.value + tax.value) * deliveryAmount).toPrecision(2);
    total.value = (subTotal.value + tax.value + delivery.value).toPrecision(2);
  }

  void clearCart() {
    cartList.clear();
    storage.setCartList(cartList);
    cartCount.value = 0;
    calcTotals();
  }
}
