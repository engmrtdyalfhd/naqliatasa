final class CarCollectionModel {
  final String title;
  final List data;

  const CarCollectionModel({required this.title, required this.data});

  factory CarCollectionModel.fromJson(Map<String, dynamic> json) =>
      CarCollectionModel(
        title: json['collection_title'],
        data: json['collection_data'],
      );

  Map<String, dynamic> toJson() => {
    'collection_title': title,
    'collection_data': data,
  };
}
