class PickupPlace {
  String address;

  PickupPlace({
    required this.address,
  });

  factory PickupPlace.fromJSON(Map<String, dynamic> json) {
    return PickupPlace(address: json['description']);
  }
}
