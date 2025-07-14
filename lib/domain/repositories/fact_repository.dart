import '../entities/fact.dart';

abstract class FactRepository {
  Future<Fact> getRandomFact();
}
