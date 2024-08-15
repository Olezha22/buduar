// ignore_for_file: non_constant_identifier_names

class UserModel {
  int user_id;
  String user_name;
  String user_surname;
  String user_email;
  String user_phoneNumber;
  String user_gender;
  String user_date;
  String user_password;

  UserModel(
    this.user_id,
    this.user_name,
    this.user_surname,
    this.user_email,
    this.user_phoneNumber,
    this.user_gender,
    this.user_date,
    this.user_password,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        int.parse(json["user_id"].toString()),
        json["user_name"],
        json["user_surname"],
        json["user_email"],
        json["user_phoneNumber"],
        json["user_gender"],
        json["user_date"].toString(),
        json["user_password"],
      );

  Map<String, dynamic> toJson() => {
        'user_id': user_id.toString(),
        'user_name': user_name,
        'user_surname': user_surname,
        'user_email': user_email,
        'user_phoneNumber': user_phoneNumber,
        'user_gender': user_gender,
        'user_date': user_date,
        'user_password': user_password,
      };
}
