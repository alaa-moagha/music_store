import '../network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiUrl('login');
  static String register = NetworkConfig.getFullApiUrl('register');
}
