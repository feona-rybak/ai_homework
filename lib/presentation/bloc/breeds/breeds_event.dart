part of 'breeds_bloc.dart';

abstract class BreedsEvent extends Equatable {
  const BreedsEvent();

  @override
  List<Object?> get props => [];
}

class BreedsFetched extends BreedsEvent {
  final bool refresh;
  const BreedsFetched({this.refresh = false});
}

class BreedsSearched extends BreedsEvent {
  final String query;
  final SearchFilter filter;
  const BreedsSearched(this.query, [this.filter = SearchFilter.all]);

  @override
  List<Object?> get props => [query, filter];
}
