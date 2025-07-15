import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie_details.dart';
import 'package:movie_app/data/repositories/tmdb_repository.dart';

import '../../../../data/models/credits.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {

  final TMDBRepository repository;

  DetailsCubit({required this.repository}) : super(DetailsState(status: DetailsStatus.initial, errorMessage: ''));


  Future<void> getDetails(int id) async {
    emit(state.copyWith(status: DetailsStatus.loading));
    try {
      final movie = await repository.getMovie(id);
      final credits = await repository.getMovieCredits(id);
      emit(state.copyWith(status: DetailsStatus.success, movie: movie, credits: credits));
    } catch (e) {
      emit(state.copyWith(status: DetailsStatus.failure, errorMessage: e.toString()));
    }
  }
}
