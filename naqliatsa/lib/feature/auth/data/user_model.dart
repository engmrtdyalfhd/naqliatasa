import '../../collection/data/model/truck_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class UserModel {
  final String phone;
  final DateTime lastLogin;
  final TruckModel? truck;

  const UserModel({
    required this.phone,
    required this.lastLogin,
    required this.truck,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    phone: json['phone'],
    lastLogin: (json['last_login'] as Timestamp).toDate(),
    truck: json['truck'] == null
        ? null
        : TruckModel.fromJson(json['truck']),
  );

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'last_login': Timestamp.fromDate(lastLogin),
    'truck': truck?.toJson(),
  };
}
