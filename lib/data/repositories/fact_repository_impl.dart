import '../../domain/entities/fact.dart';
import '../../domain/repositories/fact_repository.dart';
import '../datasources/fact_remote_data_source.dart';

class FactRepositoryImpl implements FactRepository {
  final FactRemoteDataSource remoteDataSource;
  FactRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Fact> getRandomFact() => remoteDataSource.getRandomFact();
}
