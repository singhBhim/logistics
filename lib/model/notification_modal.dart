// To parse this JSON data, do
//
//     final getAllNotification = getAllNotificationFromJson(jsonString);

import 'dart:convert';

GetAllNotification getAllNotificationFromJson(String str) => GetAllNotification.fromJson(json.decode(str));

String getAllNotificationToJson(GetAllNotification data) => json.encode(data.toJson());

class GetAllNotification {
  bool? status;
  List<NotificationList>? data;
  int? count;
  String? message;

  GetAllNotification({
    this.status,
    this.data,
    this.count,
    this.message,
  });

  factory GetAllNotification.fromJson(Map<String, dynamic> json) => GetAllNotification(
    status: json["status"],
    data: json["data"] == null ? [] : List<NotificationList>.from(json["data"]!.map((x) => NotificationList.fromJson(x))),
    count: json["count"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "count": count,
    "message": message,
  };
}

class NotificationList {
  String? id;
  ErId? senderId;
  ErId? reciverId;
  String? text;
  bool? isRead;
  ShipmentId? shipmentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  NotificationList({
    this.id,
    this.senderId,
    this.reciverId,
    this.text,
    this.isRead,
    this.shipmentId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
    id: json["_id"],
    senderId: json["SenderId"] == null ? null : ErId.fromJson(json["SenderId"]),
    reciverId: json["ReciverId"] == null ? null : ErId.fromJson(json["ReciverId"]),
    text: json["text"],
    isRead: json["IsRead"],
    shipmentId: json["ShipmentId"] == null ? null : ShipmentId.fromJson(json["ShipmentId"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "SenderId": senderId?.toJson(),
    "ReciverId": reciverId?.toJson(),
    "text": text,
    "IsRead": isRead,
    "ShipmentId": shipmentId?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class ErId {
  String? id;
  String? name;
  String? email;
  String? role;

  ErId({
    this.id,
    this.name,
    this.email,
    this.role,
  });

  factory ErId.fromJson(Map<String, dynamic> json) => ErId(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "role": role,
  };
}

class ShipmentId {
  String? id;
  String? name;

  ShipmentId({
    this.id,
    this.name,
  });

  factory ShipmentId.fromJson(Map<String, dynamic> json) => ShipmentId(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
