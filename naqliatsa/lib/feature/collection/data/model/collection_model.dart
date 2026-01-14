import 'truck_model.dart';

class CollectionModel {
  final List<TruckModel> en, ar, urdu;
  const CollectionModel({
    required this.en,
    required this.ar,
    required this.urdu,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      en: (json['en'] as List<dynamic>)
          .map((e) => TruckModel.fromJson(e))
          .toList(),
      ar: (json['ar'] as List<dynamic>)
          .map((e) => TruckModel.fromJson(e))
          .toList(),
      urdu: (json['urdu'] as List<dynamic>)
          .map((e) => TruckModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en': en.map((e) => e.toJson()).toList(),
      'ar': ar.map((e) => e.toJson()).toList(),
      'urdu': urdu.map((e) => e.toJson()).toList(),
    };
  }
}
