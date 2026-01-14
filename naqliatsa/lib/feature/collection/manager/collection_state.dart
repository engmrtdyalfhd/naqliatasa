part of 'collection_cubit.dart';

sealed class CollectionState {
  const CollectionState();
}

final class CollectionInitial extends CollectionState {}

final class CollectionLoading extends CollectionState {}

final class CollectionSuccess extends CollectionState {
  final List<TruckModel> trucks;
  const CollectionSuccess(this.trucks);
}

final class CollectionFailure extends CollectionState {
  final String error;
  const CollectionFailure(this.error);
}
