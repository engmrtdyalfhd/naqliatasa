final class CollectionDataModel {
  final List<String> load;
  final List<String> wheight;
  final List<String> carType;

  const CollectionDataModel({
    required this.load,
    required this.wheight,
    required this.carType,
  });

  factory CollectionDataModel.fromJson(Map<String, List<String>> json) {
    return CollectionDataModel(
      load: json['load'] ?? [],
      wheight: json['wheight'] ?? [],
      carType: json['car_type'] ?? [],
    );
  }

  Map<String, List<String>> toJson() => {
    'load': load,
    'wheight': wheight,
    'car_type': carType,
  };
}
