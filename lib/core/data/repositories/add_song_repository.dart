import 'package:dartz/dartz.dart';
import 'package:music_store/core/data/models/apis/song_model.dart';
import 'package:music_store/core/data/models/common_response.dart';
import 'package:music_store/core/data/network/endpoints/add_song_endpoints.dart';
import 'package:music_store/core/data/network/network_config.dart';
import 'package:music_store/core/enums/request_type.dart';
import 'package:music_store/core/utils/network_util.dart';

class AddSongRepository {
  Future<Either<String, SongModel>> addSong({
    required String title,
    required String type,
    required String price,
    required String artistId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST, // enum of request types
        url: AddSongEndpoints.addSong,
        body: {
          'title': title,
          'price': int.parse(price),
          'type': type,
          'artist_id': int.parse(artistId),
        },
        headers: NetworkConfig.getHeaders(needAuth: true),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(SongModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
