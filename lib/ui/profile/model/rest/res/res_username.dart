class ResUser {
  String? firstName;
  DateTime? birthdate;
  String? id;
  String? imageUrl;
  String? lastName;
  String? email;
  String? gender;


  ResUser(
      {this.firstName,
      this.birthdate,
      this.id,
      this.imageUrl,
      this.lastName,
      this.email,
      this.gender,
   });

  factory ResUser.fromJson(json) {
    return ResUser(
      id: json['id'],
      firstName: json['firstName'],
      birthdate: json['date'].toDate() ?? '',
      imageUrl: json['image_url'],
      lastName: json['lastName'],
      email: json['email'],
      gender: json['gender'],
    );
  }


}
