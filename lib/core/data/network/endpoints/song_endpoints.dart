import '../network_config.dart';

class SongEndPoints {
  static String getSong(int songId) {
    return NetworkConfig.getFullApiUrl('song/$songId');
  }
}
