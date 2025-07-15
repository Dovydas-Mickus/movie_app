import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repositories/tmdb_repository.dart';

import '../../../../../../data/models/movie.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {

  final TMDBRepository repository;

  SearchCubit({required this.repository}) : super(SearchState(searchQuery: '', errorMessage: '', status: SearchStatus.initial, canSearch: false));

  void searchQueryChanged(String value) {
    if (value != '' || value.isEmpty) {
      emit(state.copyWith(canSearch: true));
    }

    emit(state.copyWith(searchQuery: value));
  }

  void errorMessageChanged(String value) {
    emit(state.copyWith(errorMessage: value));
  }

  void statusChanged(SearchStatus value) {
    emit(state.copyWith(status: value));
  }

  Future<void> search() async {
    emit(state.copyWith(status: SearchStatus.loading));

    if(state.searchQuery == '') {
      emit(state.copyWith(status: SearchStatus.initial, errorMessage: 'Search query is empty'));
      return;
    }
    try {
      final results = await repository.getSearchResults(state.searchQuery);

      emit(state.copyWith(status: SearchStatus.success, movies: results));

    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), status: SearchStatus.failure));
      rethrow;
    }


  }

  void reset() {
    emit(state.copyWith(status: SearchStatus.initial, searchQuery: '', canSearch: false));
  }
}
