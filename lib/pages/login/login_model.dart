class LoginModel {
  //Not final since updating each field
  String email;
  String password;

  LoginModel({this.email, this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
