import 'package:get/get.dart';
import 'package:music_store/core/data/models/apis/artist_model.dart';
import 'package:music_store/core/data/repositories/all_artists_repository.dart';
import '../../../../core/data/models/apis/song_model.dart';
import '../../../../core/data/repositories/all_songs_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/enums/operation_type.dart';
import '../../../../core/enums/request_status.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/custom_widgets/custom_toast.dart';
import '../../../shared/utils.dart';

class HomeController extends BaseController {
  RxList<SongModel> songsList = <SongModel>[].obs;
  RxList<ArtistModel> artistsList = <ArtistModel>[].obs;

  bool get isProductLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType.contains(OperationType.PRODUCT);

  @override
  void onInit() async {
    await getAllSongs();
    await getAllArtists();
    super.onInit();
  }

  Future<void> getAllSongs() async {
    await runLoadingFutureFunction(
      type: OperationType.PRODUCT,
      function: AllSongsRepository().getAll().then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          songsList.clear();
          songsList.addAll(r);
          storage.setSongsList(songsList);
        });
      }),
    );
  }

  Future<void> getAllArtists() async {
    await runLoadingFutureFunction(
      type: OperationType.PRODUCT,
      function: AllArtistsRepository().getAll().then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          artistsList.clear();
          artistsList.addAll(r);
          storage.setArtistsList(artistsList);
        });
      }),
    );
  }
}
