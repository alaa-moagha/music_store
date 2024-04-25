import 'package:music_store/core/data/models/apis/artist_model.dart';
import '../../../core/services/base_controller.dart';

class ArtistDetailsController extends BaseController {
  ArtistModel model = ArtistModel();

  ArtistDetailsController(ArtistModel artistModel) {
    model = artistModel;
  }
}
