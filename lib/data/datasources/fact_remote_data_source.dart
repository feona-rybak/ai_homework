import 'package:dio/dio.dart';
import '../models/fact_model.dart';

abstract class FactRemoteDataSource {
  Future<FactModel> getRandomFact();
}

class FactRemoteDataSourceImpl implements FactRemoteDataSource {
  final Dio dio;
  FactRemoteDataSourceImpl(this.dio);

  @override
  Future<FactModel> getRandomFact() async {
    final response = await dio.get('https://catfact.ninja/fact');
    return FactModel.fromJson(response.data);
  }
}
