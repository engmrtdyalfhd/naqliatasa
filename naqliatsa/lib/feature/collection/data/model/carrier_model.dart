class CarrierModel {
  final String carrierType;
  final List<String> carrierFeatures;

  const CarrierModel({required this.carrierType, required this.carrierFeatures});

  factory CarrierModel.fromJson(Map<String, dynamic> json) {
    return CarrierModel(
      carrierType: json['carrier_type'] as String,
      carrierFeatures: List<String>.from(json['carrier_features']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'carrier_type': carrierType, 'carrier_features': carrierFeatures};
  }
}
