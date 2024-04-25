class CommonResponse<T> {
  T? data; //! why is it T?
  int? statusCode;
  String? message;

  CommonResponse.fromJson(Map<String, dynamic> json) {
    try {
      this.statusCode = json['statusCode'];
      if (statusCode == 200 || statusCode == 201) {
        this.data = json['response']['data'];
      } else {
        if (json['response'] != null &&
            json['response'] is Map &&
            json['response']['message'] != null) {
          this.message = json['response']['message'];
        } else {
          switch (statusCode) {
            case 400:
              message = '400 Bad request';
              break;
            case 401:
              message = '401 Unauthorized';
              break;
            case 500:
              message = '500 Internal server error';
              break;
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  bool get getStatus => statusCode == 200 || statusCode == 201 ? true : false;
}
