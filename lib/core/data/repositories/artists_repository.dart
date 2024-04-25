import 'package:dartz/dartz.dart';
import 'package:music_store/core/data/models/apis/artist_model.dart';
import 'package:music_store/core/data/network/endpoints/artist_endpoints.dart';
import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class ArtistRepository {
  Future<Either<String, List<ArtistModel>>> getArtist(int artistId) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ArtistEndPoints.getArtist(artistId),
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        print('Response: $response');
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<ArtistModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(ArtistModel.fromJson(element));
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
