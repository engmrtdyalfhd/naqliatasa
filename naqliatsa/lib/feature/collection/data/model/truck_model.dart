import 'carrier_model.dart';

class TruckModel {
  final int id;
  final String truckName;
  final List<CarrierModel> truckData;

  const TruckModel({
    required this.id,
    required this.truckName,
    required this.truckData,
  });

  factory TruckModel.fromJson(Map<String, dynamic> json) {
    return TruckModel(
      id: json["truck_id"] as int,
      truckName: json['truck_name'] as String,
      truckData: (json['truck_data'] as List<dynamic>)
          .map((e) => CarrierModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'truck_id': id,
      'truck_name': truckName,
      'truck_data': truckData.map((e) => e.toJson()).toList(),
    };
  }
}
