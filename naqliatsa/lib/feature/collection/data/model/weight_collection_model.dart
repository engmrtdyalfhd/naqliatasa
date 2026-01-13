final class WeightCollectionModel {
  final String title;
  final List data;

  const WeightCollectionModel({required this.title, required this.data});

  factory WeightCollectionModel.fromJson(Map<String, dynamic> json) =>
      WeightCollectionModel(
        title: json['collection_title'],
        data: json['collection_data'],
      );

  Map<String, dynamic> toJson() => {'collection_title': title, 'collection_data': data};
}
