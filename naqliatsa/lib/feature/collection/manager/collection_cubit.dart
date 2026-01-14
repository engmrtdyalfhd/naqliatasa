import '../data/repo/collection_repo.dart';
import '../data/model/collection_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final CollectionRepo _repo;
  CollectionCubit(this._repo) : super(CollectionInitial());

  Future<void> getCollectionData() async {
    emit(CollectionLoading());
    final result = await _repo.getCollectionData();
    result.fold(
      (failure) => emit(CollectionFailure(failure.ex)),
      (data) => emit(CollectionSuccess(data)),
    );
  }
}
