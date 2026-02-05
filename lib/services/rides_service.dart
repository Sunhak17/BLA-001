import '../data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  static List<Ride> filterByDeparture(Location departure) {
    return availableRides
        .where((ride) => ride.departureLocation == departure)
        .toList();
  }

  static List<Ride> filterBySeatRequested(int requestedSeats) {
    return availableRides
        .where((ride) => ride.availableSeats >= requestedSeats)
        .toList();
  }

  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    return availableRides 
      .where((ride) =>
        (departure == null || ride.departureLocation == departure) &&
        (seatRequested == null || ride.availableSeats >= seatRequested)
      ).toList();
  }
}
