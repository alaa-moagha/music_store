import 'package:music_store/core/enums/request_type.dart';
import '../../../ui/shared/utils.dart';

class NetworkConfig {
  // we need this for backend versionning 'api/v1/web/' to make it centeralized
  static String BASE_API = 'public/api/';
// UserEndpoints is called in UserRepository, which calls this function = full URL
  static String getFullApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth!)
        'Authorization': 'Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type == RequestType.POST) 'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}
