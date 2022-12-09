class UserModel {
  late String user_name;
  late String email;
  late String phone;
  late String gender;
  late String area;
  late String emergency_contact1;
  late String emergency_contact2;
  late String password;


  UserModel(this.user_name, this.email, this.phone, this.gender, this.area,
      this.emergency_contact1,
      this.emergency_contact2, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{

      'user_name': user_name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'area': area,
      'emergency_contact1': emergency_contact1,
      'emergency_contact2': emergency_contact2,
      'password': password
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_name = map['user_name'];
    email = map['email'];
    phone = map['phone'];
    gender = map['gender'];
    area = map['area'];
    emergency_contact1=map['emergency_contact1'];
    emergency_contact2=map['emergency_contact2'];
    password = map['password'];
  }
}