part of 'search_cubit.dart';

enum SearchStatus {
  initial,
  loading,
  success,
  failure,
}

class SearchState extends Equatable {
  final String errorMessage;
  final String searchQuery;
  final SearchStatus status;
  final List<Movie>? movies;
  final bool canSearch;

  const SearchState({required this.errorMessage, required this.status, required this.searchQuery, this.movies, required this.canSearch});

  @override
  List<Object?> get props => [errorMessage, searchQuery, status, movies, canSearch];

  SearchState copyWith({
    String? errorMessage,
    String? searchQuery,
    SearchStatus? status,
    List<Movie>? movies,
    bool? canSearch,
  }) {
    return SearchState(
      errorMessage: errorMessage ?? this.errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      status: status ?? this.status,
      movies: movies ?? this.movies,
      canSearch: canSearch ?? this.canSearch,
    );
  }
}

