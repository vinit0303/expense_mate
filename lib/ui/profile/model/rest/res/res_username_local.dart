class ResUserLocal {
  String? userName;
  DateTime? date;
  String? id;
  String? imageUrl;
  String? fullName;
  String? phoneNum;
  String? proffestion;
  String? state;
  String? city;
  String? address;

  ResUserLocal({
    this.userName,
    this.date,
    this.id,
     this.imageUrl,
     this.fullName,
     this.address,
     this.city,
     this.phoneNum,
     this.proffestion,
     this.state
  });

  factory ResUserLocal.fromJson(json) {
    return ResUserLocal(
      id: json['id'].toString(),
      userName: json['userName'],
      date: DateTime.parse(json['date']),
      imageUrl: json['image_url'],
      address:json['address'] ,
      city: json['city'],
      fullName:json['fullName'] ,
      phoneNum:json['phoneNum'] ,
      proffestion: json['proffestion'],
      state: json['state']
    );
  }
}
