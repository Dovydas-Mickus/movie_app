part of 'details_cubit.dart';

enum DetailsStatus {
  initial,
  loading,
  success,
  failure,
}

class DetailsState extends Equatable {
  final MovieDetails? movie;
  final DetailsStatus status;
  final String errorMessage;
  final Credits? credits;

  const DetailsState({this.movie, required this.status, required this.errorMessage, this.credits});

  @override
  List<Object?> get props => [movie, status, errorMessage, credits];

  DetailsState copyWith({
    MovieDetails? movie,
    DetailsStatus? status,
    String? errorMessage,
    Credits? credits
  }) {
    return DetailsState(
      movie: movie ?? this.movie,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      credits: credits ?? this.credits,
    );
  }
}
