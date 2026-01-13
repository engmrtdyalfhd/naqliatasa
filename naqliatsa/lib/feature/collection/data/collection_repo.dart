import 'package:dartz/dartz.dart';
import 'model/collection_model.dart';
import '../../../core/helper/constant.dart';
import '../../../core/common/error/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CollectionRepo {
  Future<Either<Failure, CollectionModel>> getCollectionData();
}

final class CollectionRepoImpl implements CollectionRepo {
  @override
  Future<Either<Failure, CollectionModel>> getCollectionData() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final DocumentSnapshot collection = await firestore
          .collection(DataString.dashboardCollection)
          .doc(DataString.collectionDoc)
          .get();

      print(collection.data());
      final CollectionModel data = CollectionModel.fromJson(
        collection.data() as Map<String, dynamic>,
      );

      return right(data);
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }
}
