import 'car_collection_model.dart';
import 'load_collection_model.dart';
import 'weight_collection_model.dart';

final class CollectionModel {
  final LoadCollectionModel load;
  final WeightCollectionModel wheight;
  final CarCollectionModel carType;

  const CollectionModel({
    required this.load,
    required this.wheight,
    required this.carType,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      load: LoadCollectionModel.fromJson(json['load']),
      wheight: WeightCollectionModel.fromJson(json['wheight']),
      carType: CarCollectionModel.fromJson(json['car_type']),
    );
  }

  Map<String, List> toJson() => {
    'load': load.data,
    'wheight': wheight.data,
    'car_type': carType.data,
  };
}
