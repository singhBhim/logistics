

class ApiEndPoints{
  static const baseUrl = 'https://api.tracebill.com';
  static const login = '$baseUrl/app/login';
  static const addDriverDetails = '$baseUrl/app/driver';
  static const getDriver = '$baseUrl/app/get_driver';
  static const forgotPassword = '$baseUrl/app/forget_email';
  static const passwordOtpVerify = '$baseUrl/app/forget_otp';
  static const resetPassword = '$baseUrl/app/forget_password';
  static const getAllOrders = '$baseUrl/app/shipment';
  static const getShipmentDetails = '$baseUrl/app/shipment_detail/';
  static const getShipmentBol = '$baseUrl/app/bols/';
  static const driverSignUpload = '$baseUrl/app/shipment_sign/';
  static const cancelShipment = '$baseUrl/app/shipment_update/';
  static const dashboard = '$baseUrl/app/dashboard/';
  static const reachedLocation = '$baseUrl/app/driver_reached/';
  static const getNotifications = '$baseUrl/app/get-notification/';
  static const readNotifications = '$baseUrl/app/read-notification';
  static const updateDirection = '$baseUrl/app/update_direction';
}