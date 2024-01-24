class ReqUser {
  String firstname;
  String lastName;
  DateTime birthdate;
  String id;
  String? imageUrl;
  String email;
  String gander;


  ReqUser(
      {required this.firstname,
      required this.birthdate,
      required this.id,
     this.imageUrl,
     required this.lastName,
     required this.email,
     required this.gander
      });

  Map<String, dynamic> toJson(datel) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstname;
    data['id'] = id;
    data['date'] = datel;
    data['image_url'] = imageUrl;
    data['lastName'] = lastName;
    data['email'] = email;
    data['gender'] = gander;
    return data;
  }
}
