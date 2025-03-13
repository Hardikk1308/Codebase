// To parse this JSON data, do
//
//     final schoolModel = schoolModelFromJson(jsonString);

class SchoolModel {
  int schoolId;
  String schoolName;

  SchoolModel({
    required this.schoolId,
    required this.schoolName,
  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        schoolId: json["schoolId"],
        schoolName: json["schoolName"],
      );

  Map<String, dynamic> toJson() => {
        "schoolId": schoolId,
        "schoolName": schoolName,
      };
}
