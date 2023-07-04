class Street {
  late String name;
  late String address;
  late String id;

  Street(
    this.name,
    this.address,
    this.id,
  );

  Street.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    id = json['id'];
  }
}
