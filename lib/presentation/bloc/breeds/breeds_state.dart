part of 'breeds_bloc.dart';

abstract class BreedsState extends Equatable {
  const BreedsState();

  @override
  List<Object?> get props => [];
}

class BreedsInitial extends BreedsState {}

class BreedsLoading extends BreedsState {}

class BreedsLoaded extends BreedsState {
  final List<Breed> breeds;
  final bool hasReachedEnd;
  
  const BreedsLoaded({
    required this.breeds,
    this.hasReachedEnd = false,
  });

  @override
  List<Object?> get props => [breeds, hasReachedEnd];
}

class BreedsError extends BreedsState {
  final String message;
  const BreedsError({required this.message});

  @override
  List<Object?> get props => [message];
}
