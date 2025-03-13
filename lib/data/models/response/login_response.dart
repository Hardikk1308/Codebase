//
// import 'dart:convert';
//
//   LoginResponse loginResponseFromJson(String str) =>
//       LoginResponse.fromJson(json.decode(str));
//
//   String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
//
//   class LoginResponse {
//     String status;
//     String message;
//     User user;
//
//     LoginResponse({
//       required this.status,
//       required this.message,
//       required this.user,
//     });
//
//     factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
//       status: json["status"] ?? "",
//       message: json["message"] ?? "",
//       user: User.fromJson(json["user"] ?? {}),
//     );
//
//     Map<String, dynamic> toJson() => {
//       "status": status,
//       "message": message,
//       "user": user.toJson(),
//     };
//   }
//
//   class User {
//     String userId;
//     String username;
//     String firstName;
//     String lastName;
//     String email;
//     String phone;
//     String profilePicture;
//     List<String> roles;
//     ClassMappings classMappings;
//     MoreDetails moreDetails;
//
//     User({
//       required this.userId,
//       required this.username,
//       required this.firstName,
//       required this.lastName,
//       required this.email,
//       required this.phone,
//       required this.profilePicture,
//       required this.roles,
//       required this.classMappings,
//       required this.moreDetails,
//     });
//
//
//
//     factory User.fromJson(Map<String, dynamic> json) => User(
//       userId: json["userId"] ?? "",
//       username: json["username"] ?? "",
//       firstName: json["firstName"] ?? "",
//       lastName: json["lastName"] ?? "",
//       email: json["email"] ?? "",
//       phone: json["phone"] ?? "",
//       profilePicture: json["profilePicture"] ?? "",
//       roles: json["roles"] != null ? List<String>.from(json["roles"].map((x) => x.toString())) : [],
//       classMappings: json["classMappings"] != null ? ClassMappings.fromJson(json["classMappings"]) : ClassMappings(classSubjects: {}),
//       moreDetails: json["moreDetails"] != null ? MoreDetails.fromJson(json["moreDetails"]) : MoreDetails.defaultValues(),
//     );
//
//     Map<String, dynamic> toJson() => {
//       "userId": userId,
//       "username": username,
//       "firstName": firstName,
//       "lastName": lastName,
//       "email": email,
//       "phone": phone,
//       "profilePicture": profilePicture,
//       "roles": List<dynamic>.from(roles.map((x) => x)),
//       "classMappings": classMappings.toJson(),
//       "moreDetails": moreDetails.toJson(),
//     };
//   }
//
//   class ClassMappings {
//     final Map<String, List<String>> classSubjects;
//
//     ClassMappings({
//       required this.classSubjects,
//     });
//
//     factory ClassMappings.fromJson(Map<String, dynamic> json) {
//       Map<String, List<String>> classSubjects = {};
//       json.forEach((key, value) {
//         classSubjects[key] = value != null ? List<String>.from(value.map((x) => x.toString())) : [];
//       });
//       return ClassMappings(classSubjects: classSubjects);
//     }
//
//     Map<String, dynamic> toJson() {
//       Map<String, dynamic> json = {};
//       classSubjects.forEach((key, value) {
//         json[key] = List<dynamic>.from(value.map((x) => x));
//       });
//       return json;
//     }
//   }
//
//   class MoreDetails {
//     String name;
//     String? grade;
//     String? section;
//     String? rollNumber;
//     String email;
//     String whatsAppNumber;
//     String address;
//     int age;
//     String gender;
//     DateTime dob;
//     String? bloodGrp;
//     String? admissionNo;
//     DateTime? admisionDate;
//     String? registerNo;
//     String adharNo;
//     String? mediumOfInstruction;
//     String? streamOfStudy;
//     String fatherName;
//     String motherName;
//     String? guardianName;
//     String emergencyContactNumber;
//
//     MoreDetails({
//       required this.name,
//       this.grade,
//       this.section,
//       this.rollNumber,
//       required this.email,
//       required this.whatsAppNumber,
//       required this.address,
//       required this.age,
//       required this.gender,
//       required this.dob,
//       this.bloodGrp,
//       this.admissionNo,
//       this.admisionDate,
//       this.registerNo,
//       required this.adharNo,
//       this.mediumOfInstruction,
//       this.streamOfStudy,
//       required this.fatherName,
//       required this.motherName,
//       this.guardianName,
//       required this.emergencyContactNumber,
//     });
//
//     factory MoreDetails.fromJson(Map<String, dynamic> json) => MoreDetails(
//       name: json["name"] ?? "",
//       grade: json["grade"] ?? "",
//       section: json["section"] ?? "",
//       rollNumber: json["rollNumber"] ?? "",
//       email: json["email"] ?? "",
//       whatsAppNumber: json["whatsAppNumber"] ?? "",
//       address: json["address"] ?? "",
//       age: json["age"] != null ? (json["age"] as num).toInt() : 0,
//       gender: json["gender"] ?? "",
//       dob: json["dob"] != null ? DateTime.parse(json["dob"]) : DateTime(2000, 1, 1),
//       bloodGrp: json["bloodGrp"] ?? "No detail",
//       admissionNo: json["admissionNo"] ?? "",
//       admisionDate: json["admisionDate"] != null ? DateTime.parse(json["admisionDate"]) : null,
//       registerNo: json["registerNo"] ?? "",
//       adharNo: json["adharNo"] ?? "",
//       mediumOfInstruction: json["mediumOfInstruction"] ?? "No detail",
//       streamOfStudy: json["streamOfStudy"] ?? "",
//       fatherName: json["fatherName"] ?? "",
//       motherName: json["motherName"] ?? "",
//       guardianName: json["guardianName"] ?? "",
//       emergencyContactNumber: json["emergencyContactNumber"] ?? "",
//     );
//
//     Map<String, dynamic> toJson() => {
//       "name": name,
//       "grade": grade,
//       "section": section,
//       "rollNumber": rollNumber,
//       "email": email,
//       "whatsAppNumber": whatsAppNumber,
//       "address": address,
//       "age": age,
//       "gender": gender,
//       "dob": dob.toIso8601String(),
//       "bloodGrp": bloodGrp,
//       "admissionNo": admissionNo,
//       "admisionDate": admisionDate?.toIso8601String(),
//       "registerNo": registerNo,
//       "adharNo": adharNo,
//       "mediumOfInstruction": mediumOfInstruction,
//       "streamOfStudy": streamOfStudy,
//       "fatherName": fatherName,
//       "motherName": motherName,
//       "guardianName": guardianName,
//       "emergencyContactNumber": emergencyContactNumber,
//     };
//
//     // ✅ Default values constructor to prevent null errors
//     factory MoreDetails.defaultValues() => MoreDetails(
//       name: "",
//       grade: "",
//       section: "",
//       rollNumber: "",
//       email: "",
//       whatsAppNumber: "",
//       address: "",
//       age: 0,
//       gender: "",
//       dob: DateTime(2000, 1, 1),
//       bloodGrp: "",
//       admissionNo: "",
//       admisionDate: null,
//       registerNo: "",
//       adharNo: "",
//       mediumOfInstruction: "",
//       streamOfStudy: "",
//       fatherName: "",
//       motherName: "",
//       guardianName: "",
//       emergencyContactNumber: "",
//     );
//   }

///new module add
///new final code...............................///

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String status;
  String message;
  User user;

  LoginResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"] ?? "",
    message: json["message"] ?? "",
    user: User.fromJson(json["user"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": user.toJson(),
  };

  LoginResponse copyWith({
    String? status,
    String? message,
    User? user,
  }) {
    return LoginResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}

class User {
  String userId;
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;
  String profilePicture;
  List<String> roles;
  ClassMappings classMappings;
  MoreDetails moreDetails;

  User({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.profilePicture,
    required this.roles,
    required this.classMappings,
    required this.moreDetails,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"] ?? "",
    username: json["username"] ?? "",
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    email: json["email"] ?? "",
    phone: json["phone"] ?? "",
    profilePicture: json["profilePicture"] ?? "",
    roles: json["roles"] != null
        ? List<String>.from(json["roles"].map((x) => x.toString()))
        : [],
    classMappings: json["classMappings"] != null
        ? ClassMappings.fromJson(json["classMappings"])
        : ClassMappings(classSubjects: {}),
    moreDetails: json["moreDetails"] != null
        ? MoreDetails.fromJson(json["moreDetails"])
        : MoreDetails.defaultValues(),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "profilePicture": profilePicture,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "classMappings": classMappings.toJson(),
    "moreDetails": moreDetails.toJson(),
  };

  User copyWith({
    String? userId,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? profilePicture,
    List<String>? roles,
    ClassMappings? classMappings,
    MoreDetails? moreDetails,
  }) {
    return User(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      roles: roles ?? this.roles,
      classMappings: classMappings ?? this.classMappings,
      moreDetails: moreDetails ?? this.moreDetails,
    );
  }
}

class ClassMappings {
  final Map<String, List<String>> classSubjects;

  ClassMappings({required this.classSubjects});

  factory ClassMappings.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>> classSubjects = {};
    json.forEach((key, value) {
      classSubjects[key] = value != null
          ? List<String>.from(value.map((x) => x.toString()))
          : [];
    });
    return ClassMappings(classSubjects: classSubjects);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    classSubjects.forEach((key, value) {
      json[key] = List<dynamic>.from(value.map((x) => x));
    });
    return json;
  }

  ClassMappings copyWith({Map<String, List<String>>? classSubjects}) {
    return ClassMappings(
      classSubjects: classSubjects ?? this.classSubjects,
    );
  }
}

class MoreDetails {
  String name;
  String? grade;
  String? section;
  String? rollNumber;
  String email;
  String whatsAppNumber;
  String address;
  int age;
  String gender;
  DateTime dob;
  String? bloodGrp;
  String? admissionNo;
  DateTime? admisionDate;
  String? registerNo;
  String adharNo;
  String? mediumOfInstruction;
  String? streamOfStudy;
  String fatherName;
  String motherName;
  String? guardianName;
  String emergencyContactNumber;

  MoreDetails({
    required this.name,
    this.grade,
    this.section,
    this.rollNumber,
    required this.email,
    required this.whatsAppNumber,
    required this.address,
    required this.age,
    required this.gender,
    required this.dob,
    this.bloodGrp,
    this.admissionNo,
    this.admisionDate,
    this.registerNo,
    required this.adharNo,
    this.mediumOfInstruction,
    this.streamOfStudy,
    required this.fatherName,
    required this.motherName,
    this.guardianName,
    required this.emergencyContactNumber,
  });

  factory MoreDetails.fromJson(Map<String, dynamic> json) => MoreDetails(
    name: json["name"] ?? "",
    grade: json["grade"] ?? "",
    section: json["section"] ?? "",
    rollNumber: json["rollNumber"] ?? "",
    email: json["email"] ?? "",
    whatsAppNumber: json["whatsAppNumber"] ?? "",
    address: json["address"] ?? "",
    age: json["age"] != null ? (json["age"] as num).toInt() : 0,
    gender: json["gender"] ?? "",
    dob: json["dob"] != null ? DateTime.parse(json["dob"]) : DateTime(2000, 1, 1),
    bloodGrp: json["bloodGrp"] ?? "No detail",
    admissionNo: json["admissionNo"] ?? "",
    admisionDate: json["admisionDate"] != null ? DateTime.parse(json["admisionDate"]) : null,
    registerNo: json["registerNo"] ?? "",
    adharNo: json["adharNo"] ?? "",
    mediumOfInstruction: json["mediumOfInstruction"] ?? "No detail",
    streamOfStudy: json["streamOfStudy"] ?? "",
    fatherName: json["fatherName"] ?? "",
    motherName: json["motherName"] ?? "",
    guardianName: json["guardianName"] ?? "",
    emergencyContactNumber: json["emergencyContactNumber"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "grade": grade,
    "section": section,
    "rollNumber": rollNumber,
    "email": email,
    "whatsAppNumber": whatsAppNumber,
    "address": address,
    "age": age,
    "gender": gender,
    "dob": dob.toIso8601String(),
    "bloodGrp": bloodGrp,
    "admissionNo": admissionNo,
    "admisionDate": admisionDate?.toIso8601String(),
    "registerNo": registerNo,
    "adharNo": adharNo,
    "mediumOfInstruction": mediumOfInstruction,
    "streamOfStudy": streamOfStudy,
    "fatherName": fatherName,
    "motherName": motherName,
    "guardianName": guardianName,
    "emergencyContactNumber": emergencyContactNumber,
  };

  MoreDetails copyWith({
    String? address,
    String? bloodGrp,
    String? streamOfStudy,
    String? fatherName,
    String? motherName, String? mediumOfInstruction, String? guardianName,
  }) {
    return MoreDetails(
      name: this.name,
      address: address ?? this.address,
      bloodGrp: bloodGrp ?? this.bloodGrp,
      streamOfStudy: streamOfStudy ?? this.streamOfStudy,
      fatherName: this.fatherName,
      motherName: this.motherName,
      email: this.email,
      whatsAppNumber: this.whatsAppNumber,
      age: this.age,
      gender: this.gender,
      dob: this.dob,
      adharNo: this.adharNo,
      emergencyContactNumber: this.emergencyContactNumber,
    );
  }
  factory MoreDetails.defaultValues() => MoreDetails(
    name: "",
    grade: "",
    section: "",
    rollNumber: "",
    email: "",
    whatsAppNumber: "",
    address: "",
    age: 0,
    gender: "",
    dob: DateTime(2000, 1, 1),
    bloodGrp: "",
    admissionNo: "",
    admisionDate: null,
    registerNo: "",
    adharNo: "",
    mediumOfInstruction: "",
    streamOfStudy: "",
    fatherName: "",
    motherName: "",
    guardianName: "",
    emergencyContactNumber: "",
  );

}
