import 'package:music_store/core/data/models/apis/song_model.dart';
import 'package:music_store/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import '../../../core/enums/bottom_navigation.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';

class SongDetailsController extends BaseController {
  SongModel model = SongModel();

  SongDetailsController(SongModel songModel) {
    model = songModel;
  }

  void addToCart() {
    cartService.addToCart(
      model: model,
      count: 1,
      afterAdd: () {
        Get.off(MainView(
          pageNumber: 2,
          selectedItem: BottomNavigationEnum.CART,
        ));
      },
    );
  }
}
