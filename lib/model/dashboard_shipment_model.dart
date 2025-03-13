
import 'dart:convert';

DashboardShipmentModel dashboardShipmentModelFromJson(String str) => DashboardShipmentModel.fromJson(json.decode(str));

String dashboardShipmentModelToJson(DashboardShipmentModel data) => json.encode(data.toJson());

class DashboardShipmentModel {
  bool? status;
  String? message;
  ShipmentDashboardData? data;

  DashboardShipmentModel({
    this.status,
    this.message,
    this.data,
  });

  factory DashboardShipmentModel.fromJson(Map<String, dynamic> json) => DashboardShipmentModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ShipmentDashboardData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class ShipmentDashboardData {
  int? shipment;
  StatusData? statusData;
  List<ShipmentDatum>? shipmentData;

  ShipmentDashboardData({
    this.shipment,
    this.statusData,
    this.shipmentData,
  });

  factory ShipmentDashboardData.fromJson(Map<String, dynamic> json) => ShipmentDashboardData(
    shipment: json["Shipment"],
    statusData: json["statusData"] == null ? null : StatusData.fromJson(json["statusData"]),
    shipmentData: json["ShipmentData"] == null ? [] : List<ShipmentDatum>.from(json["ShipmentData"]!.map((x) => ShipmentDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Shipment": shipment,
    "statusData": statusData?.toJson(),
    "ShipmentData": shipmentData == null ? [] : List<dynamic>.from(shipmentData!.map((x) => x.toJson())),
  };
}

class ShipmentDatum {
  String? id;
  String? name;
  String? description;
  String? pickupLocation;
  String? dropLocation;
  String? currentLocation;
  ErId? customerId;
  String? status;
  ErId? shipperId;
  ErId? brokerId;
  ErId? carrierId;
  DriverId? driverId;
  DateTime? shippingDate;
  DateTime? deliveryDateExpect;
  int? cost;
  String? paymentStatus;
  int? quantity;
  int? weight;
  String? dimensions;
  String? typeOfGoods;
  String? uploadedBol;
  String? driverAccept;
  dynamic customerSign;
  String? driverSign;
  dynamic review;
  DateTime? createdAt;
  int? v;
  String? driverLocation;

  ShipmentDatum({
    this.id,
    this.name,
    this.description,
    this.pickupLocation,
    this.dropLocation,
    this.currentLocation,
    this.customerId,
    this.status,
    this.shipperId,
    this.brokerId,
    this.carrierId,
    this.driverId,
    this.shippingDate,
    this.deliveryDateExpect,
    this.cost,
    this.paymentStatus,
    this.quantity,
    this.weight,
    this.dimensions,
    this.typeOfGoods,
    this.uploadedBol,
    this.driverAccept,
    this.customerSign,
    this.driverSign,
    this.review,
    this.createdAt,
    this.v,
    this.driverLocation,
  });

  factory ShipmentDatum.fromJson(Map<String, dynamic> json) => ShipmentDatum(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    pickupLocation: json["pickup_location"],
    dropLocation: json["drop_location"],
    currentLocation: json["current_location"],
    customerId: json["customer_id"] == null ? null : ErId.fromJson(json["customer_id"]),
    status: json["status"],
    shipperId: json["shipper_id"] == null ? null : ErId.fromJson(json["shipper_id"]),
    brokerId: json["broker_id"] == null ? null : ErId.fromJson(json["broker_id"]),
    carrierId: json["carrier_id"] == null ? null : ErId.fromJson(json["carrier_id"]),
    driverId: json["driver_id"] == null ? null : DriverId.fromJson(json["driver_id"]),
    shippingDate: json["shippingDate"] == null ? null : DateTime.parse(json["shippingDate"]),
    deliveryDateExpect: json["deliveryDateExpect"] == null ? null : DateTime.parse(json["deliveryDateExpect"]),
    cost: json["cost"],
    paymentStatus: json["paymentStatus"],
    quantity: json["quantity"],
    weight: json["weight"],
    dimensions: json["dimensions"],
    typeOfGoods: json["typeOfGoods"],
    uploadedBol: json["uploadedBol"],
    driverAccept: json["driverAccept"],
    customerSign: json["customer_sign"],
    driverSign: json["driver_sign"],
    review: json["review"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    v: json["__v"],
    driverLocation: json["driver_location"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "pickup_location": pickupLocation,
    "drop_location": dropLocation,
    "current_location": currentLocation,
    "customer_id": customerId?.toJson(),
    "status": status,
    "shipper_id": shipperId?.toJson(),
    "broker_id": brokerId?.toJson(),
    "carrier_id": carrierId?.toJson(),
    "driver_id": driverId?.toJson(),
    "shippingDate": "${shippingDate!.year.toString().padLeft(4, '0')}-${shippingDate!.month.toString().padLeft(2, '0')}-${shippingDate!.day.toString().padLeft(2, '0')}",
    "deliveryDateExpect": "${deliveryDateExpect!.year.toString().padLeft(4, '0')}-${deliveryDateExpect!.month.toString().padLeft(2, '0')}-${deliveryDateExpect!.day.toString().padLeft(2, '0')}",
    "cost": cost,
    "paymentStatus": paymentStatus,
    "quantity": quantity,
    "weight": weight,
    "dimensions": dimensions,
    "typeOfGoods": typeOfGoods,
    "uploadedBol": uploadedBol,
    "driverAccept": driverAccept,
    "customer_sign": customerSign,
    "driver_sign": driverSign,
    "review": review,
    "created_at": createdAt?.toIso8601String(),
    "__v": v,
    "driver_location": driverLocation,
  };
}

class ErId {
  String? id;
  String? name;
  String? email;

  ErId({
    this.id,
    this.name,
    this.email,
  });

  factory ErId.fromJson(Map<String, dynamic> json) => ErId(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
  };
}

class DriverId {
  String? id;
  String? name;
  String? email;
  String? driverIdRef;
  String? address;
  String? vin;
  String? companyName;
  String? mcNumber;
  int? v;

  DriverId({
    this.id,
    this.name,
    this.email,
    this.driverIdRef,
    this.address,
    this.vin,
    this.companyName,
    this.mcNumber,
    this.v,
  });

  factory DriverId.fromJson(Map<String, dynamic> json) => DriverId(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    driverIdRef: json["driver_id_ref"],
    address: json["address"],
    vin: json["vin"],
    companyName: json["company_name"],
    mcNumber: json["mc_number"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "driver_id_ref": driverIdRef,
    "address": address,
    "vin": vin,
    "company_name": companyName,
    "mc_number": mcNumber,
    "__v": v,
  };
}

class StatusData {
  int? delivered;
  int? pending;
  int? transit;

  StatusData({
    this.delivered,
    this.pending,
    this.transit,
  });

  factory StatusData.fromJson(Map<String, dynamic> json) => StatusData(
    delivered: json["delivered"],
    pending: json["pending"],
    transit: json["transit"],
  );

  Map<String, dynamic> toJson() => {
    "delivered": delivered,
    "pending": pending,
    "transit": transit,
  };
}
