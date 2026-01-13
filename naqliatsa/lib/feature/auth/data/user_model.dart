import 'package:cloud_firestore/cloud_firestore.dart';
import '../../collection/data/model/collection_model.dart';

final class UserModel {
  final String phone;
  final DateTime lastLogin;
  final CollectionModel? collectionData;

  const UserModel({
    required this.phone,
    required this.lastLogin,
    required this.collectionData,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    phone: json['phone'],
    lastLogin: (json['last_login'] as Timestamp).toDate(),
    collectionData: json['collection_data'] == null
        ? null
        : CollectionModel.fromJson(json['collection_data']),
  );

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'last_login': Timestamp.fromDate(lastLogin),
    'collection_data': collectionData?.toJson(),
  };
}
