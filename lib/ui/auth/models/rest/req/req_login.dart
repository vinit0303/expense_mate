class ReqLogin {
  String email;
  String password;
  String? username;

  ReqLogin({required this.email,required this.password,this.username});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['userName'] = username;
    return data;
  }
}
