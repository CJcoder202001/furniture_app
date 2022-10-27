// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
  Userdata({
    required this.uniqueId,
    required this.username,
    required this.phoneNumber,
    required this.emailId,
    required this.password,
    required this.type,
  });

  String uniqueId;
  String username;
  String phoneNumber;
  String emailId;
  String password;
  String type;

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        uniqueId: json["unique id"],
        username: json["Username"],
        phoneNumber: json["Phone Number"],
        emailId: json["Email Id"],
        password: json["Password"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "unique id": uniqueId,
        "Username": username,
        "Phone Number": phoneNumber,
        "Email Id": emailId,
        "Password": password,
        "type": type,
      };
}
