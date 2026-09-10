import 'package:traveller_app/utils/services/http_services/http_client.dart';

import 'api_constants.dart';
enum EndPoint{
  login,
  userRegistration,
  getProfile,
  updateProfile,
  changePassword,
  createRequest,
  getAllLocations,
  getLocations,
  updateAddress,
  deleteLocation,
  createLocation,
  getUserRequest,
  getRideRequest,
  updateRideRequest,
  deleteRideRequest,
  getAllUsers,
  activateUser,
  getAllRequests,
  rejectRideRequest,
  getDrivers,
  createRide,
  getAllRides,
  deleteRides,
  driverGetAllocatedRides,
  driverUpdateRide,
  driverUpdateRideLocation,
  getAllocatedRides,
  getCompletedRides,
  forgotPassword,
  getCountries,
  getStates,
  validateOtp,
  getNotification,
  newNotification,
  updateReadStatus,
  GetCountRequest,
  addCoordinator,
  updateUserStatus,
  userVerifyOtp
}
extension URLExtension on EndPoint {
  String get url {
    switch (this) {
      case EndPoint.login:
        return concatenate(ApiConstants.login);
      case EndPoint.userRegistration:
        return concatenate(ApiConstants.userRegistration);
      case EndPoint.getProfile:
        return concatenate(ApiConstants.getProfile);
      case EndPoint.updateProfile:
        return concatenate(ApiConstants.updateProfile);
      case EndPoint.changePassword:
        return concatenate(ApiConstants.changePassword);
      case EndPoint.createRequest:
        return concatenate(ApiConstants.createRequest);
      case EndPoint.getAllLocations:
        return concatenate(ApiConstants.getAllLocations);
      case EndPoint.getLocations:
        return concatenate(ApiConstants.getLocations);
      case EndPoint.updateAddress:
        return concatenate(ApiConstants.updateLocation);
      case EndPoint.deleteLocation:
        return concatenate(ApiConstants.deleteLocation);
      case EndPoint.createLocation:
        return concatenate(ApiConstants.createLocation);
      case EndPoint.getUserRequest:
        return concatenate(ApiConstants.getUserRequest);
      case EndPoint.getRideRequest:
        return concatenate(ApiConstants.getRideRequest);
      case EndPoint.updateRideRequest:
        return concatenate(ApiConstants.updateRideRequest);
      case EndPoint.deleteRideRequest:
        return concatenate(ApiConstants.deleteRideRequest);
      case EndPoint.getAllUsers:
        return concatenate(ApiConstants.getAllUsers);
      case EndPoint.activateUser:
        return concatenate(ApiConstants.activateUser);
      case EndPoint.getAllRequests:
        return concatenate(ApiConstants.getAllRequests);
      case EndPoint.rejectRideRequest:
        return concatenate(ApiConstants.rejectRideRequest);
      case EndPoint.getDrivers:
        return concatenate(ApiConstants.getDrivers);
      case EndPoint.createRide:
        return concatenate(ApiConstants.createRide);
      case EndPoint.getAllRides:
        return concatenate(ApiConstants.getAllRides);
      case EndPoint.deleteRides:
        return concatenate(ApiConstants.deleteRides);
      case EndPoint.driverGetAllocatedRides:
        return concatenate(ApiConstants.driverGetAllocatedRides);
      case EndPoint.driverUpdateRide:
        return concatenate(ApiConstants.driverUpdateRide);
      case EndPoint.driverUpdateRideLocation:
        return concatenate(ApiConstants.getNotification);
      case EndPoint.getAllocatedRides:
        return concatenate(ApiConstants.getAllocatedRides);
      case EndPoint.getCompletedRides:
        return concatenate(ApiConstants.getCompletedRides);
      case EndPoint.forgotPassword:
        return concatenate(ApiConstants.forgotPassword);
      case EndPoint.getCountries:
        return concatenate(ApiConstants.getCountries);
      case EndPoint.getStates:
        return concatenate(ApiConstants.getStates);
      case EndPoint.validateOtp:
        return concatenate(ApiConstants.validateOtp);
      case EndPoint.getNotification:
        return concatenate(ApiConstants.getNotification);
      case EndPoint.newNotification:
        return concatenate(ApiConstants.newNotification);
      case EndPoint.updateReadStatus:
        return concatenate(ApiConstants.updateReadStatus);
      case EndPoint.GetCountRequest:
        return concatenate(ApiConstants.GetCountRequest);
      case EndPoint.addCoordinator:
        return concatenate(ApiConstants.addCoordinator);
      case EndPoint.updateUserStatus:
        return concatenate(ApiConstants.updateUserStatus);
      case EndPoint.userVerifyOtp:
        return concatenate(ApiConstants.userVerifyOtp);





    }
  }
  /// this method is used to replace | with id
  String cleanUrlWith(List<ReplaceId> listId) {
    String modifiedurl = url;
    for (var value in listId) {
      modifiedurl = modifiedurl.replaceAll(
          "${value.param}=", "${value.param}=${value.id}");
    }

    return modifiedurl;
  }

  String concatenate(String endpoint, {EndPoint? endpointType}) {
    return ApiConstants.baseUrl + endpoint;
  }

}
class ReplaceId {
  final String param;
  final int id;

  ReplaceId({required this.param, required this.id});
}
extension RequestMode on EndPoint {
  RequestType get requestType {
    RequestType requestType = RequestType.get;

    switch (this) {
      case EndPoint.login:
      case EndPoint.userRegistration:
      case EndPoint.changePassword:
      case EndPoint.createRequest:
      case EndPoint.createLocation:
      case EndPoint.getDrivers:
      case EndPoint.createRide:
      case EndPoint.forgotPassword:
      case EndPoint.validateOtp:
      case EndPoint.newNotification:
      case EndPoint.addCoordinator:
      case EndPoint.getAllRequests:
      case EndPoint.getAllRides:
      case EndPoint.driverGetAllocatedRides:
      case EndPoint.userVerifyOtp:
        requestType = RequestType.post;
      case EndPoint.getProfile:
      case EndPoint.getAllLocations:
      case EndPoint.getLocations:
      case EndPoint.getUserRequest:
      case EndPoint.getRideRequest:
      case EndPoint.getAllUsers:



      case EndPoint.getAllocatedRides:
      case EndPoint.getCompletedRides:
      case EndPoint.getCountries:
      case EndPoint.getStates:
      case EndPoint.getNotification:
      case EndPoint.GetCountRequest:
        requestType = RequestType.get;
      case EndPoint.updateProfile:
      case EndPoint.updateAddress:
      case EndPoint.updateRideRequest:
      case EndPoint.activateUser:
      case EndPoint.driverUpdateRide:
      case EndPoint.driverUpdateRideLocation:
      case EndPoint.updateReadStatus:
      case EndPoint.updateUserStatus:
        requestType =RequestType.put;
      case EndPoint.deleteLocation:
      case EndPoint.deleteRideRequest:
      case EndPoint.rejectRideRequest:
      case EndPoint.deleteRides:
        requestType =RequestType.delete;
        break;
    }
    return requestType;
  }
}
extension Token on EndPoint {
  bool get shouldAddToken {
    var shouldAdd = true;
    switch (this) {
      case EndPoint.login:
      case EndPoint.userRegistration:
      default:
    }
    return shouldAdd;
  }
}
