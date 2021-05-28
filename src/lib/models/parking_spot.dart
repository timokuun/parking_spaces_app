class ParkingSpot {
  final String spaceID;
  final String name;
  final int price;
  final bool available;
  final DateTime startTime;
  final List<String> spotImages;

  ParkingSpot(
      {this.spaceID,
      this.name,
      this.price,
      this.available,
      this.startTime,
      this.spotImages});
}

final List<ParkingSpot> spots = [
  ParkingSpot(
    spaceID: "A1",
    name: "UCSD Hopkins L1S23",
    price: 3,
    available: true,
    startTime: DateTime(2021, 4, 23, 16, 45),
  ),
  ParkingSpot(
    spaceID: "A2",
    name: "UCSD Hopkins L1S19",
    price: 3,
    available: true,
    startTime: DateTime(2021, 4, 23, 16, 50),
  ),
  ParkingSpot(
    spaceID: "A3",
    name: "UCSD Hopkins L1S04",
    price: 3,
    available: true,
    startTime: DateTime(2021, 4, 23, 16, 53),
  ),
  ParkingSpot(
    spaceID: "A4",
    name: "UCSD Hopkins L1S07",
    price: 3,
    available: true,
    startTime: DateTime(2021, 4, 23, 16, 55),
  ),
  ParkingSpot(
    spaceID: "A5",
    name: "UCSD Hopkins L1S09",
    price: 3,
    available: true,
    startTime: DateTime(2021, 4, 23, 16, 57),
  ),
  ParkingSpot(
    spaceID: "A6",
    name: "UCSD Hopkins L1S11",
    price: 3,
    available: true,
    startTime: DateTime(2021, 4, 23, 16, 59),
  ),
  ParkingSpot(
    spaceID: "A7",
    name: "UCSD Hopkins L1S12",
    price: 3,
    available: true,
    startTime: DateTime(2021, 4, 23, 17, 01),
  ),
];

List<String> spots1 = [
  'assets/images/spot4.jpg',
  'assets/images/spot2.jpg',
  'assets/images/spot3.jpg',
];

List<String> spots2 = [
  'assets/images/spot1.jpg',
  'assets/images/spot2.jpg',
  'assets/images/spot3.jpg',
];

ParkingSpot pangea1 = ParkingSpot(
    spaceID: "P1",
    name: "Pangea L2S4",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots1);

ParkingSpot pangea2 = ParkingSpot(
    spaceID: "P2",
    name: "Pangea L1S2",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots1);

ParkingSpot pangea3 = ParkingSpot(
    spaceID: "P3",
    name: "Pangea L2S7",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots1);

ParkingSpot hopkins1 = ParkingSpot(
    spaceID: "Hop1",
    name: "Hopkins L1S1",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots2);

ParkingSpot hopkins2 = ParkingSpot(
    spaceID: "Hop2",
    name: "Hopkins L2S8",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots2);

ParkingSpot hopkins3 = ParkingSpot(
    spaceID: "Hop3",
    name: "Hopkins L1S2",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots2);

ParkingSpot hillcrest1 = ParkingSpot(
    spaceID: "Hill1",
    name: "Hillcrest L1S6",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots1);

ParkingSpot hillcrest2 = ParkingSpot(
    spaceID: "Hill2",
    name: "Hillcrest L1S5",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots1);

ParkingSpot hillcrest3 = ParkingSpot(
    spaceID: "Hill3",
    name: "Hillcrest L2S5",
    price: 4,
    available: true,
    startTime: DateTime.now(),
    spotImages: spots1);
