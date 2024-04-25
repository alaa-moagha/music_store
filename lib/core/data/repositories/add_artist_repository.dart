import 'package:dartz/dartz.dart';
import 'package:music_store/core/data/models/apis/artist_model.dart';
import 'package:music_store/core/data/models/common_response.dart';
import 'package:music_store/core/data/network/endpoints/add_artist_endpoints.dart';
import 'package:music_store/core/data/network/network_config.dart';
import 'package:music_store/core/enums/request_type.dart';
import 'package:music_store/core/utils/network_util.dart';

class AddArtistRepository {
  Future<Either<String, ArtistModel>> addArtist({
    required String firstName,
    required String lastName,
    required String gender,
    required String country,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST, // enum of request types
        url: AddArtistEndpoints.addArtist,
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'gender': gender,
          'country': country,
        },
        headers: NetworkConfig.getHeaders(),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(ArtistModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
