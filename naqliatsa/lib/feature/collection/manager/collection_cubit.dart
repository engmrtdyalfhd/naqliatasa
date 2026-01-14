import 'package:flutter/material.dart';
import '../data/model/truck_model.dart';
import '../data/repo/collection_repo.dart';
import '../data/model/collection_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final CollectionRepo _repo;
  CollectionCubit(this._repo) : super(CollectionInitial());

  Future<void> getCollectionData(BuildContext context) async {
    emit(CollectionLoading());
    final result = await _repo.getCollectionData();
    result.fold(
      (failure) => emit(CollectionFailure(failure.ex)),
      (data) => emit(CollectionSuccess(_suitableLang(context, data))),
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

  // Future<void> updateUserTruck() async {
  //   emit(CollectionLoading());
  //   final result = await _repo.updateTruck(state.truck!);
  //   result.fold(
  //     (failure) => emit(CollectionFailure(failure.ex)),
  //     (data) => emit(CollectionSuccess(state.collection!)),
  //   );
  // }
}
