// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

class ListProfileModel {
  String status;
  List<ProfileModel> data;
  String message;

  ListProfileModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ListProfileModel.fromJson(Map<String, dynamic> json) =>
      ListProfileModel(
        status: json["status"],
        data: List<ProfileModel>.from(
            json["data"].map((x) => ProfileModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class ProfileModel {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  ProfileModel({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        "profile_image": profileImage,
      };
}
