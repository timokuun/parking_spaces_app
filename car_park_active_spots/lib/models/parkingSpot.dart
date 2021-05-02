class ParkingSpot {
  final String spaceID;
  final String name;
  final String address;
  final int price;
  final bool available;
  final double latitude;
  final double longitude;
  final DateTime startTime;

  ParkingSpot(
      {this.spaceID,
      this.name,
      this.address,
      this.price,
      this.available,
      this.latitude,
      this.longitude,
      this.startTime});
}
