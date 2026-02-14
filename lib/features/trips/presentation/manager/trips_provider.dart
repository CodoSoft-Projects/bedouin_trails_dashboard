import 'package:flutter/widgets.dart';

import '../../../../core/models/pagination_model.dart';
import '../../../../core/models/trip/trip_model.dart';
import '../../data/trips_repo.dart';

class TripsProvider extends ChangeNotifier {
  TripsRepo repo = TripsRepo();
  // String message = '';

  /// Get All Active Trips
  List<TripModel> trips = [];
  PaginationModel pagination = PaginationModel.empty();

  var tripSearchController = TextEditingController();
  var tripDurationController = TextEditingController();

  String allTripsMessage = '';
  bool? checkGetAllActiveTrips = false;
  Future<void> getAllActiveTrips({int page = 1}) async {
    //* Loading State
    checkGetAllActiveTrips = null;
    notifyListeners();

    final response = await repo.getAllActiveTrips(
      page: page,
      search: tripSearchController.text,
      duration: tripDurationController.text,
    );

    response.fold(
      (message) {
        checkGetAllActiveTrips = false;
        allTripsMessage = message;
      },
      (tripsRespone) {
        checkGetAllActiveTrips = true;
        trips = tripsRespone.trips;
        pagination = tripsRespone.pagination;
      },
    );

    notifyListeners();
  }

  /// On Select Trip
  TripModel? selectedTrip;
  void onSelectTrip(TripModel trip) {
    selectedTrip = trip;
    notifyListeners();
  }

  /// Get All Inactive Trips
  List<TripModel> inactiveTrips = [];
  PaginationModel inactivePagination = PaginationModel.empty();

  var inactiveTripSearchController = TextEditingController();
  var inactiveTripDurationController = TextEditingController();

  String inActiveTripsMessage = '';
  bool? checkGetAllInactiveTrips = false;
  Future<void> getAllInactiveTrips({int page = 1}) async {
    //* Loading State
    checkGetAllActiveTrips = null;
    notifyListeners();

    final response = await repo.getAllInactiveTrips(
      page: page,
      search: inactiveTripSearchController.text,
    );

    response.fold(
      (message) {
        inActiveTripsMessage = message;
        checkGetAllActiveTrips = false;
      },
      (tripsRespone) {
        checkGetAllActiveTrips = true;
        inactiveTrips = tripsRespone.trips;
        inactivePagination = tripsRespone.pagination;
      },
    );

    notifyListeners();
  }
}
