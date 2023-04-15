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
    this.name,
    this.year,
    this.color,
    this.pantone_value,
  });

  final String? id;
  final String? name;
  final String? year;
  final String? color;
  final String? pantone_value;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        color: json["color"],
        pantone_value: json["pantone_value"],
      );
}
