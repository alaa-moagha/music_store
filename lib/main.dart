import 'package:flutter/material.dart';
import 'package:music_store/core/data/repositories/shared_preference_repository.dart';
import 'package:music_store/core/services/cart_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(
    () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );
  Get.put(SharedPreferenceRepository());
  Get.put(CartService());
  runApp(MyApp());
}
