class InfoModel {
  InfoModel({
    this.page,
    this.data,
  });

  final int? page;
  final Data? data;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
         page: json["page"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.id,
    this.email,
    this.first_name,
    this.lastname,
    this.avatar,
  });

  final String? id;
  final String? email;
  final String? first_name;
  final String? lastname;
  final String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        first_name: json["first_name"],
        lastname: json["lastname"],
        avatar: json["avatar"],
      );
}
