
import 'dart:convert';

GetDriverDetailsModel getDriverDetailsModelFromJson(String str) => GetDriverDetailsModel.fromJson(json.decode(str));

String getDriverDetailsModelToJson(GetDriverDetailsModel data) => json.encode(data.toJson());

class GetDriverDetailsModel {
  bool? status;
  String? message;
  DriverDetails? data;

  GetDriverDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetDriverDetailsModel.fromJson(Map<String, dynamic> json) => GetDriverDetailsModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : DriverDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class DriverDetails {
  Driver? driver;
  UserResult? userResult;

  DriverDetails({
    this.driver,
    this.userResult,
  });

  factory DriverDetails.fromJson(Map<String, dynamic> json) => DriverDetails(
    driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
    userResult: json["UserResult"] == null ? null : UserResult.fromJson(json["UserResult"]),
  );

  Map<String, dynamic> toJson() => {
    "driver": driver?.toJson(),
    "UserResult": userResult?.toJson(),
  };
}

class Driver {
  String? id;
  String? driverIdRef;
  String? address;
  String? vin;
  dynamic companyName;
  dynamic mcNumber;
  int? v;

  Driver({
    this.id,
    this.driverIdRef,
    this.address,
    this.vin,
    this.companyName,
    this.mcNumber,
    this.v,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["_id"],
    driverIdRef: json["driver_id_ref"],
    address: json["address"],
    vin: json["vin"],
    companyName: json["company_name"],
    mcNumber: json["mc_number"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "driver_id_ref": driverIdRef,
    "address": address,
    "vin": vin,
    "company_name": companyName,
    "mc_number": mcNumber,
    "__v": v,
  };
}

class UserResult {
  String? id;
  String? name;

  UserResult({
    this.id,
    this.name,
  });

  factory UserResult.fromJson(Map<String, dynamic> json) => UserResult(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
