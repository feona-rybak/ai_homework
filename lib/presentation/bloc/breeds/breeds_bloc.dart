import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/search_filter.dart';
import '../../../domain/entities/breed.dart';
import '../../../domain/usecases/get_breeds.dart';

part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final GetBreeds getBreeds;
  int _page = 0;
  bool _isFetching = false;
  final List<Breed> _allBreeds = [];
  String _currentQuery = '';
  SearchFilter _currentFilter = SearchFilter.all;

  BreedsBloc(this.getBreeds) : super(BreedsInitial()) {
    on<BreedsFetched>(_onBreedsFetched);
    on<BreedsSearched>(_onBreedsSearched);
  }

  Future<void> _onBreedsFetched(BreedsFetched event, Emitter<BreedsState> emit) async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      final isInitialLoad = state is! BreedsLoaded || event.refresh;
      
      if (isInitialLoad) {
        emit(BreedsLoading());
        _page = 0;
        _allBreeds.clear();
      } else {
        _page++;
      }

      var breeds = await getBreeds(page: _page);
      
      // Shuffle breeds on initial load to show they're not sorted
      if (isInitialLoad) {
        breeds = List.of(breeds)..shuffle();
      }
      
      _allBreeds.addAll(breeds);
      
      // Always apply the current filter and search query if they exist
      List<Breed> breedsToDisplay;
      
      if (_currentQuery.isNotEmpty) {
        breedsToDisplay = _filterBreeds(_currentQuery, _currentFilter);
      } else {
        breedsToDisplay = _allBreeds.toList();
      }
      
      // Apply sorting if name filter is selected
      if (_currentFilter == SearchFilter.name) {
        breedsToDisplay.sort((a, b) => a.name.compareTo(b.name));
      }
      
      emit(BreedsLoaded(
        breeds: List.unmodifiable(breedsToDisplay),
        hasReachedEnd: breeds.isEmpty,
      ));
    } catch (e) {
      emit(BreedsError(message: e.toString()));
    } finally {
      _isFetching = false;
    }
  }

  void _onBreedsSearched(BreedsSearched event, Emitter<BreedsState> emit) {
    _currentQuery = event.query.trim().toLowerCase();
    _currentFilter = event.filter;
    
    print('Search event - Query: "$_currentQuery", Filter: ${_currentFilter.toString()}');
    
    try {
      // Always use _filterBreeds to handle both filtering and sorting
      final breedsToDisplay = _filterBreeds(_currentQuery, _currentFilter);
      
      print('Emitting ${breedsToDisplay.length} breeds with filter: ${_currentFilter.toString()}');
      
      emit(BreedsLoaded(
        breeds: List.unmodifiable(breedsToDisplay),
        hasReachedEnd: false,
      ));
    } catch (e) {
      print('Error in _onBreedsSearched: $e');
      emit(BreedsError(message: 'Failed to filter breeds: ${e.toString()}'));
    }
  }
  
  List<Breed> _filterBreeds(String query, SearchFilter filter) {
    List<Breed> result = List<Breed>.from(_allBreeds);
    
    // Apply search filter if query is not empty
    if (query.isNotEmpty) {
      final searchQuery = query.toLowerCase();
      result = result.where((breed) {
        return breed.name.toLowerCase().contains(searchQuery) ||
               (filter == SearchFilter.all && (
                 (breed.description?.toLowerCase().contains(searchQuery) ?? false) ||
                 (breed.origin?.toLowerCase().contains(searchQuery) ?? false) ||
                 (breed.temperament?.toLowerCase().contains(searchQuery) ?? false)
               ));
      }).toList();
    }
    
    // Apply sorting if name filter is selected
    if (filter == SearchFilter.name) {
      result.sort((a, b) => a.name.compareTo(b.name));
    }
    
    return result;
  }
}
