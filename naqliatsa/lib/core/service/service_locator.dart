import 'package:get_it/get_it.dart';

import '../../feature/collection/data/repo/collection_repo.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerLazySingleton<CollectionRepoImpl>(CollectionRepoImpl.new);
}
