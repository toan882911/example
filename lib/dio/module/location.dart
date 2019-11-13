class Location {
  final String street;
  final String city;
  final String state;
  Location(this.street, this.city, this.state);

  Location.fromJson(Map<String, dynamic> json)
      : street = json["street"].toString(),
        city = json["city"].toString(),
        state = json["state"].toString();
}