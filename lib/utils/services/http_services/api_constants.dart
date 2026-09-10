class ApiConstants {
  static String baseUrl = "https://pseudoovally-abatable-margit.ngrok-free.dev/api/";
  static String login = "User/Login";
  static String userRegistration = "User/UserRegistration";
  static String getProfile = "User/GetProfile";
  static String updateProfile = "User/UpdateProfile";
  static String changePassword = "User/ChangePassword";
  static String forgotPassword = "User/ForgotPassword";
  static String validateOtp = "User/ValidateOtp";


  ///Traveller
  static String createRequest = "Traveler/CreateRideRequest";
  static String GetCountRequest = "Traveler/GetRequestCount";
  static String getAllLocations = "Traveler/GetAllLocations";
  static String getLocations = "Traveler/GetLocation?locationId=";
  static String updateLocation = "Traveler/UpdateLocation";
  static String deleteLocation = "Traveler/DeleteLocation?locationId=";
  static String createLocation = "Traveler/CreateLocation";
  static String getUserRequest = "Traveler/GetUserRequests?status=";
  static String getRideRequest = "Traveler/GetRideRequest?rideRequestId=";
  static String updateRideRequest = "Traveler/UpdateRideRequest";
  static String deleteRideRequest = "Traveler/DeleteRideRequest?rideRequestId=";
  static String getAllocatedRides = "Traveler/GetAllocatedRides";
  static String getCompletedRides = "Traveler/GetCompletedRides";
  static String getCountries = "Traveler/GetCountries";
  static String getStates = "Traveler/GetStateByCountry";



  ///coordinator

static String getAllUsers = "Coordinator/GetAllUsers?status=";
static String activateUser = "Coordinator/VerifyUserAccount";
static String getAllRequests = "Coordinator/GetAllRequests";
static String rejectRideRequest = "Coordinator/RejectRideRequest?rideRequestId=";
static String getDrivers = "Coordinator/GetDrivers";
static String createRide = "Coordinator/CreateRide";
static String getAllRides = "Coordinator/GetAllRides";
static String deleteRides = "Coordinator/DeleteRide?rideId=";
static String addCoordinator = "Coordinator/CreateUser";
static String updateUserStatus = "Coordinator/UpdateUserStatus";


///Driver

static String driverGetAllocatedRides = "Driver/GetAllocatedRides";
static String driverUpdateRide = "Driver/UpdateRide";
static String driverUpdateRideLocation = "Driver/UpdateRideLocation";
static String userVerifyOtp = "Driver/UserVerifyOtp";

///Notifications

  static String getNotification = "Notification/GetNotifications";
  static String newNotification = "Notification/NewNotification";
  static String updateReadStatus = "Notification/UpdateReadStatus";
}