import 'package:dartz/dartz.dart';
import 'package:music_store/core/data/models/apis/song_model.dart';
import 'package:music_store/core/data/network/endpoints/song_endpoints.dart';
import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class SongRepository {
  Future<Either<String, List<SongModel>>> getSong(int songId) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SongEndPoints.getSong(songId),
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        print('Response: $response');
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<SongModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(SongModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
