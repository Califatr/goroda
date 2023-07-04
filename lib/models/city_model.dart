class City {
  late String id;
  late String name;
  late int countPeople;
  late String lat;
  late String long;
  late DateTime pictureDate;
  late String image;

  City(
    this.id,
    this.name,
    this.countPeople,
    this.lat,
    this.long,
    this.pictureDate,
    this.image,
  );

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    countPeople = json['totalPeople'];
    lat = json['lat'];
    long = json['long'];
    image = json['image'];
    pictureDate = DateTime.parse(json['dateTimeImage']);
    id = json['id'];
  }
}
