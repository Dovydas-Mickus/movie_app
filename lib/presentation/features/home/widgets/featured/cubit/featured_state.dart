part of 'featured_cubit.dart';

enum FeaturedStatus {
  initial,
  loading,
  success,
  failure,
}

class FeaturedState extends Equatable {

  final List<Movie>? movies;
  final String errorMessage;
  final FeaturedStatus status;

  const FeaturedState({required this.status, required this.errorMessage, this.movies});

  @override
  List<Object?> get props => [status, errorMessage, status];

  FeaturedState copyWith({
    List<Movie>? movies,
    String? errorMessage,
    FeaturedStatus? status,
  }) {
    return FeaturedState(
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}