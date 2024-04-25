import 'package:music_store/core/data/models/apis/artist_model.dart';
import 'package:music_store/core/services/base_controller.dart';
import 'package:get/get.dart';
import 'package:music_store/ui/shared/utils.dart';

class AllArtistsController extends BaseController {
  RxList<ArtistModel> artistsList = storage.getArtistsList().obs;
}
