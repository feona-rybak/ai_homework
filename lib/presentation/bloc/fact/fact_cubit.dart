import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/fact.dart';
import '../../../domain/usecases/get_random_fact.dart';

part 'fact_state.dart';

class FactCubit extends Cubit<FactState> {
  final GetRandomFact getRandomFact;
  FactCubit(this.getRandomFact) : super(FactInitial());

  Future<void> fetch() async {
    emit(FactLoading());
    try {
      final fact = await getRandomFact();
      emit(FactLoaded(fact: fact));
    } catch (e) {
      emit(FactError(message: e.toString()));
    }
  }
}
