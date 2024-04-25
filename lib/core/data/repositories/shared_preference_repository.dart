import 'dart:convert';
import 'package:music_store/core/data/models/apis/artist_model.dart';
import 'package:music_store/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/apis/song_model.dart';
import '../models/apis/token_info.dart';
import '../models/cart_model.dart';

class SharedPreferenceRepository {
  SharedPreferences globalSharedPrefs = Get.find();
  // Constants representing preference keys
  String PREF_IS_LOGINED = 'is_logined';
  String PREF_CART_LIST = 'cart';
  String PREF_SONGS_LIST = 'songs';
  String PREF_ARTISTS_LIST = 'artist';
  String PREF_USER_ID = 'id';
  String PREF_TOKEN_INFO = 'access_token';

  setIsLogined(bool value) {
    setPreference(dataType: DataType.BOOL, key: PREF_IS_LOGINED, value: value);
  }

  bool getIsLogined() {
    if (globalSharedPrefs.containsKey(PREF_IS_LOGINED))
      return getPreference(key: PREF_IS_LOGINED);
    else
      return false;
  }

  void setCartList(List<CartModel> list) {
    setPreference(
        dataType: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (globalSharedPrefs.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPreference(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }

  void setSongsList(List<SongModel> list) {
    setPreference(
        dataType: DataType.STRING,
        key: PREF_SONGS_LIST,
        value: SongModel.encode(list));
  }

  List<SongModel> getSongsList() {
    if (globalSharedPrefs.containsKey(PREF_SONGS_LIST)) {
      return SongModel.decode(getPreference(key: PREF_SONGS_LIST));
    } else {
      return [];
    }
  }

  void setArtistsList(List<ArtistModel> list) {
    setPreference(
        dataType: DataType.STRING,
        key: PREF_ARTISTS_LIST,
        value: ArtistModel.encode(list));
  }

  List<ArtistModel> getArtistsList() {
    if (globalSharedPrefs.containsKey(PREF_ARTISTS_LIST)) {
      return ArtistModel.decode(getPreference(key: PREF_ARTISTS_LIST));
    } else {
      return [];
    }
  }

  // Sets the preference based on the specified data type
  // using the globalSharedPrefs instance
  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPrefs.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPrefs.setBool(key, value);
        break;
      case DataType.STRING:
        await globalSharedPrefs.setString(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPrefs.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await globalSharedPrefs.setStringList('items', <String>[key, value]);
        break;
    }
  }

  // Retrieves the preference value using the globalSharedPrefs instance
  dynamic getPreference({required String key}) {
    return globalSharedPrefs.get(key);
  }

  setTokenInfo(TokenInfo value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPrefs.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(
          jsonDecode(getPreference(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }
}
