import '../entities/breed.dart';

abstract class BreedRepository {
  Future<List<Breed>> getBreeds({int page = 0});
}
