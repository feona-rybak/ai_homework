import '../entities/fact.dart';
import '../repositories/fact_repository.dart';

class GetRandomFact {
  final FactRepository repository;
  GetRandomFact(this.repository);

  Future<Fact> call() => repository.getRandomFact();
}
