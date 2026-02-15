import 'package:flutter/widgets.dart';

import '../../../../core/enums/trip_status.dart';
import '../../../../core/functions/pick_image_universal.dart';
import '../../../../core/functions/pick_multiple_image_universal.dart';
import '../../../../core/models/pagination_model.dart';
import '../../../../core/models/picked_image_model.dart';
import '../../../../core/models/trip/trip_card_model.dart';
import '../../../../core/models/trip/trip_model.dart';
import '../../data/trips_repo.dart';

class TripsProvider extends ChangeNotifier {
  TripsRepo repo = TripsRepo();
  String message = '';

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
    getTripDetails();
  }

  /// Get trip details
  bool? checkGetTripDetails = false;
  Future<void> getTripDetails() async {
    checkGetTripDetails = null;
    notifyListeners();
    final response = await repo.getTripDetails(id: selectedTrip!.id);
    response.fold(
      (message) {
        checkGetTripDetails = false;
        message = message;
      },
      (tripRes) {
        checkGetTripDetails = true;
        selectedTrip = tripRes.trip;
        fillTripControllers(selectedTrip!);
      },
    );
    notifyListeners();
  }

  /// Get All Inactive Trips
  List<TripModel> inactiveTrips = [];
  PaginationModel inactivePagination = PaginationModel.empty();

  var inactiveTripSearchController = TextEditingController();

  String inActiveTripsMessage = '';
  bool? checkGetAllInactiveTrips = false;
  Future<void> getAllInactiveTrips({int page = 1}) async {
    //* Loading State
    checkGetAllInactiveTrips = null;
    notifyListeners();

    final response = await repo.getAllInactiveTrips(
      page: page,
      search: inactiveTripSearchController.text,
    );

    response.fold(
      (message) {
        inActiveTripsMessage = message;
        checkGetAllInactiveTrips = false;
      },
      (tripsRespone) {
        checkGetAllInactiveTrips = true;
        inactiveTrips = tripsRespone.trips;
        inactivePagination = tripsRespone.pagination;
      },
    );

    notifyListeners();
  }

  /// toggle trip status
  bool? checkToggleTripStatus = false;

  Future<void> toggleTripStatus({
    required int id,
    required TripStatus status,
  }) async {
    checkToggleTripStatus = null;
    notifyListeners();

    final response = await repo.toggleTripStatus(id: id, status: status);
    response.fold(
      (message) {
        this.message = message;
        checkToggleTripStatus = false;
        notifyListeners();
      },
      (model) {
        checkToggleTripStatus = true;
        message = model.message;
        getTripDetails();
        getAllActiveTrips();
        getAllInactiveTrips();
      },
    );
  }

  /// Delete Trip
  bool? checkDeleteTrip = false;
  Future<void> deleteTrip({required int id}) async {
    checkDeleteTrip = null;
    notifyListeners();

    final response = await repo.deleteTrip(id: id);
    response.fold(
      (message) {
        this.message = message;
        checkDeleteTrip = false;
        notifyListeners();
      },
      (model) {
        checkDeleteTrip = true;
        message = model.message;
        getAllActiveTrips();
        getAllInactiveTrips();
      },
    );
  }

  /// Some fields for add or update trip info
  var formKey = GlobalKey<FormState>();
  var tripNameController = TextEditingController();
  TripStatus tripStatus = TripStatus.unknown;
  var tripPriceController = TextEditingController();
  var tripFromController = TextEditingController();
  var tripToController = TextEditingController();

  void fillTripControllers(TripModel trip) {
    tripNameController.text = trip.name;
    tripStatus = trip.status;
    tripPriceController.text = trip.price.toString();
    tripFromController.text = trip.interfaceFrom;
    tripToController.text = trip.interfaceTo;
  }

  void clearTripControllers() {
    tripNameController.clear();
    tripStatus = TripStatus.unknown;
    tripPriceController.clear();
    tripFromController.clear();
    tripToController.clear();
  }

  /// update trip
  bool? checkUpdateTrip = false;
  Future<void> updateTrip() async {
    checkUpdateTrip = null;
    notifyListeners();

    final response = await repo.updateTrip(
      id: selectedTrip!.id,
      name: tripNameController.text,
      image: selectedTrip!.image,
      price: double.parse(tripPriceController.text),
      interfaceFrom: tripFromController.text,
      interfaceTo: tripToController.text,
      status: tripStatus,
    );
    response.fold(
      (message) {
        this.message = message;
        checkUpdateTrip = false;
        notifyListeners();
      },
      (model) {
        checkUpdateTrip = true;
        message = model.message;
        getTripDetails();
      },
    );
  }

  /// upload trip images
  List<PickedImage> tripImages = [];
  void addTripImages() async {
    tripImages += await pickMultipleImagesUniversal();
    notifyListeners();
  }

  /// remove image from uploaded list
  void removeImageFromUploadedList(PickedImage image) {
    tripImages.remove(image);
    notifyListeners();
  }

  /// update trip [upload images for trip]
  Future<void> updateTripImages() async {
    checkUpdateTrip = null;
    notifyListeners();

    final response = await repo.updateTripImages(
      id: selectedTrip!.id,
      images: tripImages,
    );
    response.fold(
      (message) {
        checkUpdateTrip = false;
        this.message = message;
        notifyListeners();
      },
      (model) {
        checkUpdateTrip = true;
        message = model.message;
        tripImages = [];
        getTripDetails();
      },
    );
  }

  /// Remove trip image
  bool? checkRemoveingImage = false;

  Future<void> removeTripImage({required int imageId}) async {
    checkRemoveingImage = null;
    notifyListeners();
    final response = await repo.removeTripImage(imageId: imageId);
    response.fold(
      (message) {
        this.message = message;
        checkRemoveingImage = false;
      },
      (model) {
        checkRemoveingImage = true;
        message = model.message;
        // remove the image from the selected trip galleries
        selectedTrip!.galleries.removeWhere((element) => element.id == imageId);
      },
    );
    notifyListeners();
  }

  /// Add & Update Cart in the Trip Day
  PickedImage? cartImage;
  void uploadCartImage() async {
    cartImage = await pickImageUniversal();
    notifyListeners();
  }

  void clearCartImage() {
    cartImage = null;
    notifyListeners();
  }

  var cartFormKey = GlobalKey<FormState>();
  var cartTitleController = TextEditingController();
  var cartDescriptionController = TextEditingController();

  void clearCartControllers() {
    clearCartImage();
    cartTitleController.clear();
    cartDescriptionController.clear();
  }

  void fillCartControllers(TripCardModel cart) {
    clearCartImage();
    cartTitleController.text = cart.title;
    cartDescriptionController.text = cart.description;
  }

  bool? checkAddingCart = false;
  Future<void> addCardToTripDay({required int tripDayId}) async {
    checkAddingCart = null;
    notifyListeners();

    final response = await repo.addCardToTripDay(
      tripDayId: tripDayId,
      image: cartImage!,
      title: cartTitleController.text,
      description: cartDescriptionController.text,
    );
    response.fold(
      (message) {
        this.message = message;
        checkAddingCart = false;
        notifyListeners();
      },
      (model) {
        checkAddingCart = true;
        message = model.message;
        clearCartControllers();
        getTripDetails();
      },
    );
  }

  /// Update Card of Trip Day
  bool? checkUpdatingCart = false;

  Future<void> updateCardOfTripDay({
    required int cartId,
    // required int tripDayId,
  }) async {
    checkUpdatingCart = null;
    notifyListeners();

    final response = await repo.updateCardOfTripDay(
      cartId: cartId,
      title: cartTitleController.text,
      description: cartDescriptionController.text,
      image: cartImage,
    );
    response.fold(
      (message) {
        this.message = message;
        checkUpdatingCart = false;
        notifyListeners();
      },
      (model) {
        checkUpdatingCart = true;
        message = model.message;
        clearCartControllers();
        getTripDetails();
      },
    );
  }
}
