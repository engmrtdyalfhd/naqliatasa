final class LoadCollectionModel {
  final String title;
  final List data;

  const LoadCollectionModel({required this.title, required this.data});

  factory LoadCollectionModel.fromJson(Map<String, dynamic> json) =>
      LoadCollectionModel(
        title: json['collection_title'],
        data: json['collection_data'],
      );

  Map<String, dynamic> toJson() => {'collection_title': title, 'collection_data': data};
}
