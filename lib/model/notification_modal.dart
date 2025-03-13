
import 'dart:convert';

GetAllNotification getAllNotificationFromJson(String str) => GetAllNotification.fromJson(json.decode(str));

String getAllNotificationToJson(GetAllNotification data) => json.encode(data.toJson());

class GetAllNotification {
  bool? status;
  int? count;
  List<NotificationList>? data;
  String? message;

  GetAllNotification({
    this.status,
    this.count,
    this.data,
    this.message,
  });

  factory GetAllNotification.fromJson(Map<String, dynamic> json) => GetAllNotification(
    status: json["status"],
    count: json["count"],
    data: json["data"] == null ? [] : List<NotificationList>.from(json["data"]!.map((x) => NotificationList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class NotificationList {
  String? id;
  String? senderId;
  List<dynamic>? receiverShipperId;
  List<ReceiverErId>? receiverCustomerId;
  List<ReceiverErId>? receiverBrokerId;
  List<ReceiverCarrierId>? receiverCarrierId;
  ShipmentId? shipmentId;
  List<ReceiverDriverId>? receiverDriverId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  NotificationList({
    this.id,
    this.senderId,
    this.receiverShipperId,
    this.receiverCustomerId,
    this.receiverBrokerId,
    this.receiverCarrierId,
    this.shipmentId,
    this.receiverDriverId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
    id: json["_id"],
    senderId: json["senderId"],
    receiverShipperId: json["receiverShipperId"] == null ? [] : List<dynamic>.from(json["receiverShipperId"]!.map((x) => x)),
    receiverCustomerId: json["receiverCustomerId"] == null ? [] : List<ReceiverErId>.from(json["receiverCustomerId"]!.map((x) => ReceiverErId.fromJson(x))),
    receiverBrokerId: json["receiverBrokerId"] == null ? [] : List<ReceiverErId>.from(json["receiverBrokerId"]!.map((x) => ReceiverErId.fromJson(x))),
    receiverCarrierId: json["receiverCarrierId"] == null ? [] : List<ReceiverCarrierId>.from(json["receiverCarrierId"]!.map((x) => ReceiverCarrierId.fromJson(x))),
    shipmentId: json["ShipmentId"] == null ? null : ShipmentId.fromJson(json["ShipmentId"]),
    receiverDriverId: json["receiverDriverId"] == null ? [] : List<ReceiverDriverId>.from(json["receiverDriverId"]!.map((x) => ReceiverDriverId.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "senderId": senderId,
    "receiverShipperId": receiverShipperId == null ? [] : List<dynamic>.from(receiverShipperId!.map((x) => x)),
    "receiverCustomerId": receiverCustomerId == null ? [] : List<dynamic>.from(receiverCustomerId!.map((x) => x.toJson())),
    "receiverBrokerId": receiverBrokerId == null ? [] : List<dynamic>.from(receiverBrokerId!.map((x) => x.toJson())),
    "receiverCarrierId": receiverCarrierId == null ? [] : List<dynamic>.from(receiverCarrierId!.map((x) => x.toJson())),
    "ShipmentId": shipmentId?.toJson(),
    "receiverDriverId": receiverDriverId == null ? [] : List<dynamic>.from(receiverDriverId!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class ReceiverErId {
  bool? isRead;
  String? id;

  ReceiverErId({
    this.isRead,
    this.id,
  });

  factory ReceiverErId.fromJson(Map<String, dynamic> json) => ReceiverErId(
    isRead: json["IsRead"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "IsRead": isRead,
    "_id": id,
  };
}

class ReceiverCarrierId {
  String? receiver;
  bool? isRead;
  String? id;

  ReceiverCarrierId({
    this.receiver,
    this.isRead,
    this.id,
  });

  factory ReceiverCarrierId.fromJson(Map<String, dynamic> json) => ReceiverCarrierId(
    receiver: json["Receiver"],
    isRead: json["IsRead"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "Receiver": receiver,
    "IsRead": isRead,
    "_id": id,
  };
}

class ReceiverDriverId {
  Receiver? receiver;
  bool? isRead;
  String? id;

  ReceiverDriverId({
    this.receiver,
    this.isRead,
    this.id,
  });

  factory ReceiverDriverId.fromJson(Map<String, dynamic> json) => ReceiverDriverId(
    receiver: json["Receiver"] == null ? null : Receiver.fromJson(json["Receiver"]),
    isRead: json["IsRead"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "Receiver": receiver?.toJson(),
    "IsRead": isRead,
    "_id": id,
  };
}

class Receiver {
  String? id;
  String? name;
  String? email;
  String? role;
  String? contact;
  int? otp;
  bool? otpVerify;
  String? createdBy;
  int? v;

  Receiver({
    this.id,
    this.name,
    this.email,
    this.role,
    this.contact,
    this.otp,
    this.otpVerify,
    this.createdBy,
    this.v,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    contact: json["contact"],
    otp: json["Otp"],
    otpVerify: json["OtpVerify"],
    createdBy: json["created_by"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "role": role,
    "contact": contact,
    "Otp": otp,
    "OtpVerify": otpVerify,
    "created_by": createdBy,
    "__v": v,
  };
}

class ShipmentId {
  String? id;
  String? name;
  String? description;
  String? pickupLocation;
  String? dropLocation;
  String? currentLocation;
  String? customerId;
  String? status;
  String? shipperId;
  String? brokerId;
  String? carrierId;
  String? driverId;
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
  String? driverLocation;
  dynamic review;
  DateTime? createdAt;
  int? v;

  ShipmentId({
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
    this.driverLocation,
    this.review,
    this.createdAt,
    this.v,
  });

  factory ShipmentId.fromJson(Map<String, dynamic> json) => ShipmentId(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    pickupLocation: json["pickup_location"],
    dropLocation: json["drop_location"],
    currentLocation: json["current_location"],
    customerId: json["customer_id"],
    status: json["status"],
    shipperId: json["shipper_id"],
    brokerId: json["broker_id"],
    carrierId: json["carrier_id"],
    driverId: json["driver_id"],
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
    driverLocation: json["driver_location"],
    review: json["review"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "pickup_location": pickupLocation,
    "drop_location": dropLocation,
    "current_location": currentLocation,
    "customer_id": customerId,
    "status": status,
    "shipper_id": shipperId,
    "broker_id": brokerId,
    "carrier_id": carrierId,
    "driver_id": driverId,
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
    "driver_location": driverLocation,
    "review": review,
    "created_at": createdAt?.toIso8601String(),
    "__v": v,
  };
}
