import 'dart:convert';

class ArtistModel {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? country;
  String? createdAt;
  String? updatedAt;
  String? image;
  List<Songs>? songs;

  ArtistModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.country,
      this.createdAt,
      this.updatedAt,
      this.image,
      this.songs});

  ArtistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    if (json['songs'] != null) {
      songs = <Songs>[];
      json['songs'].forEach((v) {
        songs?.add(new Songs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    if (this.songs != null) {
      data['songs'] = this.songs?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Map<String, dynamic> toMap(ArtistModel model) {
    return {
      "id": model.id,
      "first_name": model.firstName,
      "last_name": model.lastName,
      "gender": model.gender,
      "country": model.country,
      "image": model.image,
      "created_at": model.createdAt,
      "updatedAt": model.updatedAt,
      "songs": model.songs,
    };
  }

  static String encode(List<ArtistModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => ArtistModel.toMap(element))
            .toList(),
      );

  static List<ArtistModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<ArtistModel>((item) => ArtistModel.fromJson(item))
          .toList();
}

class Songs {
  int? id;
  String? title;
  String? type;
  int? price;
  String? image;
  int? artistId;
  String? createdAt;
  String? updatedAt;

  Songs(
      {this.id,
      this.title,
      this.type,
      this.price,
      this.image,
      this.artistId,
      this.createdAt,
      this.updatedAt});

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    artistId = json['artist_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['price'] = this.price;
    data['image'] = this.image;
    data['artist_id'] = this.artistId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
