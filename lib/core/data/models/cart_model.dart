import 'dart:convert';
import 'apis/song_model.dart';

class CartModel {
  int? count;
  double? total;
  SongModel? songModel;

  CartModel({this.count, this.total, this.songModel});

  CartModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    songModel = json['product_model'] != null
        ? new SongModel.fromJson(json['product_model'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['total'] = this.total;
    if (this.songModel != null) {
      data['product_model'] = this.songModel!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toMap(CartModel model) {
    return {
      "count": model.count,
      "total": model.total,
      "product_model": model.songModel,
    };
  }

  static String encode(List<CartModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => CartModel.toMap(element))
            .toList(),
      );

  static List<CartModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}
