import '../../domain/entities/breed.dart';
import '../../domain/repositories/breed_repository.dart';
import '../datasources/breed_remote_data_source.dart';

class BreedRepositoryImpl implements BreedRepository {
  final BreedRemoteDataSource remoteDataSource;
  BreedRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Breed>> getBreeds({int page = 0}) {
    return remoteDataSource.getBreeds(page: page);
  }
}
