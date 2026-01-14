import 'carrier_model.dart';

class TruckModel {
  final String truckName;
  final List<CarrierModel> truckData;

  const TruckModel({required this.truckName, required this.truckData});

  factory TruckModel.fromJson(Map<String, dynamic> json) {
    return TruckModel(
      truckName: json['truck_name'] as String,
      truckData: (json['truck_data'] as List<dynamic>)
          .map((e) => CarrierModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'truck_name': truckName,
      'truck_data': truckData.map((e) => e.toJson()).toList(),
    };
  }
}
