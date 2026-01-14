import 'package:flutter/material.dart';
import '../data/model/carrier_model.dart';
import '../data/model/truck_model.dart';
import '../data/model/user_truck_model.dart';
import '../data/repo/collection_repo.dart';
import '../data/model/collection_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/carrier_feature_model.dart';
import 'package:easy_localization/easy_localization.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final CollectionRepo _repo;
  UserTruckModel userSelection = UserTruckModel(
    truckId: 0,
    carrierId: 0,
    featureId: 0,
  );
  List<CarrierModel> carriers = [];
  List<CarrierFeatureModel> features = [];
  CollectionCubit(this._repo) : super(CollectionInitial());

  Future<void> getCollectionData(BuildContext context) async {
    emit(CollectionLoading());
    final result = await _repo.getCollectionData();
    result.fold(
      (failure) => emit(CollectionFailure(failure.ex)),
      (data) => emit(CollectionFetched(_suitableLang(context, data))),
    );
  }

  List<TruckModel> _suitableLang(
    BuildContext context,
    CollectionModel collection,
  ) {
    switch (context.locale.languageCode) {
      case 'ar':
        return collection.ar;
      case 'ur':
        return collection.ur;
      case 'en':
      default:
        return collection.en;
    }
  }

  void selectTruck(TruckModel truck) {
    carriers = truck.carriers;
    userSelection.truckId = truck.id;
    emit(TruckSelected(truck.carriers));
  }

  void selectCarrier(CarrierModel carrier) {
    features = carrier.carrierFeatures;
    userSelection.carrierId = carrier.id;
    emit(CarrierSelected(carrier.carrierFeatures));
  }

  void selectFeature(CarrierFeatureModel feature) {
    userSelection.featureId = feature.id;
  }

  // Future<void> updateUserTruck() async {
  //   if (state is! CollectionFetched) return;
  //   emit(CollectionLoading());
  //   final result = await _repo.updateTruck(userTruck);
  //   result.fold(
  //     (failure) => emit(CollectionFailure(failure.ex)),
  //     (data) => emit(CollectionUpdated()),
  //   );
  // }
}
