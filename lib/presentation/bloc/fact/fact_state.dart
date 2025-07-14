part of 'fact_cubit.dart';

abstract class FactState extends Equatable {
  const FactState();

  @override
  List<Object?> get props => [];
}

class FactInitial extends FactState {}

class FactLoading extends FactState {}

class FactLoaded extends FactState {
  final Fact fact;
  const FactLoaded({required this.fact});
  @override
  List<Object?> get props => [fact];
}

class FactError extends FactState {
  final String message;
  const FactError({required this.message});

  @override
  List<Object?> get props => [message];
}
