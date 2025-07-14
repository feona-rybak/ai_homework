import 'package:dio/dio.dart';
import '../models/breed_model.dart';

abstract class BreedRemoteDataSource {
  Future<List<BreedModel>> getBreeds({int page = 0, int limit = 20});
}

class BreedRemoteDataSourceImpl implements BreedRemoteDataSource {
  final Dio dio;
  BreedRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<BreedModel>> getBreeds({int page = 0, int limit = 20}) async {
    final response = await dio.get('/breeds', queryParameters: {
      'page': page,
      'limit': limit,
    });

    final list = (response.data as List).map((e) => BreedModel.fromJson(e)).toList();
    return list;
  }
}
