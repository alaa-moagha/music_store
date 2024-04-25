import 'dart:convert';

class SongModel {
  int? id;
  String? title;
  String? type;
  int? price;
  String? image;
  int? artistId;
  String? createdAt;
  String? updatedAt;
  Artist? artist;

  SongModel(
      {this.id,
      this.title,
      this.type,
      this.price,
      this.image,
      this.artistId,
      this.createdAt,
      this.updatedAt,
      this.artist});

  SongModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    artistId = json['artist_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
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
    if (this.artist != null) {
      data['artist'] = this.artist?.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toMap(SongModel model) {
    return {
      "id": model.id,
      "title": model.title,
      "price": model.price,
      "type": model.type,
      "artistId": model.artistId,
      "image": model.image,
      "artist": model.artist,
      "createdAt": model.createdAt,
      "updatedAt": model.updatedAt,
    };
  }

  static String encode(List<SongModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => SongModel.toMap(element))
            .toList(),
      );

  static List<SongModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<SongModel>((item) => SongModel.fromJson(item))
          .toList();
}

class Artist {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? country;
  String? createdAt;
  String? updatedAt;
  String? image;

  Artist(
      {this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.country,
      this.createdAt,
      this.updatedAt,
      this.image});

  Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
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
    return data;
  }
}
