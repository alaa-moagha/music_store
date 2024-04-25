import 'package:dartz/dartz.dart';
import 'package:music_store/core/data/models/apis/invoice_model.dart';
import 'package:music_store/core/data/models/common_response.dart';
import 'package:music_store/core/data/network/endpoints/invoice_endpoints.dart';
import 'package:music_store/core/data/network/network_config.dart';
import 'package:music_store/core/enums/request_type.dart';
import 'package:music_store/core/utils/network_util.dart';

class CreateInvoiceRepository {
  Future<Either<String, InvoiceModel>> createInvoice({
    required String creditCard,
    required List<int> songIds,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST, // enum of request types
        url: InvoiceEndpoints.createInvoice,
        body: {
          'song_ids': songIds,
          'credit_card': creditCard,
        },
        headers: NetworkConfig.getHeaders(needAuth: true),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(InvoiceModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
