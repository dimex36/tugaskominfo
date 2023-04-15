class LoginModel {
  LoginModel({
    this.message,
    this.data,
  });

  final String? message;
  final Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["token"],
      );
}

class Data {
  Data({
    this.token,
  });

  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );
}
