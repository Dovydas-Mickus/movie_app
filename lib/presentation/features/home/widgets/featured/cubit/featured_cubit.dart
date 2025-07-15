import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/repositories/tmdb_repository.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {

  final TMDBRepository repository;

  FeaturedCubit({required this.repository}) : super(FeaturedState(errorMessage: '', status: FeaturedStatus.initial));

  Future<void> getFeatured() async {
    emit(state.copyWith(status: FeaturedStatus.loading));

    try {
      final movies = await repository.getFeatured();
      emit(state.copyWith(movies: movies, status: FeaturedStatus.success));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), status: FeaturedStatus.failure));
    }
  }
}
