import '../network_config.dart';

class ArtistEndPoints {
  static String getArtist(int artistId) {
    return NetworkConfig.getFullApiUrl('song/$artistId');
  }
}
