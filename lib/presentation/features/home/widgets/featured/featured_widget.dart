import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repositories/tmdb_repository.dart';
import 'package:movie_app/presentation/common_widgets/movie_poster_card.dart';
import 'package:movie_app/presentation/features/home/widgets/featured/cubit/featured_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';


class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FeaturedCubit(repository: context.read<TMDBRepository>())
            ..getFeatured(),
      child: BlocBuilder<FeaturedCubit, FeaturedState>(
        builder: (context, state) {
          switch (state.status) {
            case FeaturedStatus.loading:
              return Center(child: CircularProgressIndicator());

            case FeaturedStatus.initial:
              return Center(child: CircularProgressIndicator());

            case FeaturedStatus.failure:
              return Text(state.errorMessage);

            case FeaturedStatus.success:
              return CarouselSlider.builder(
                itemCount: state.movies!.length,
                itemBuilder: (context, index, realIndex) {
                  final movie = state.movies![index];
                  return MoviePosterCard(movie: movie, isLarge: false,);
                },
                options: CarouselOptions(
                  autoPlay: true,
                  // The height of the carousel
                  height: 220,

                  // The fraction of the viewport that each page should occupy.
                  // < 1.0 to show parts of the next and previous items.
                  viewportFraction: 0.4,

                  // Makes the central item larger than the others
                  enlargeCenterPage: false,

                  // Spacing between each item
                  pageSnapping: false,
                  padEnds: false,

                  // Other useful options:
                  // autoPlay: true,
                  // autoPlayInterval: Duration(seconds: 3),
                ),
              );
          }
        },
      ),
    );
  }
}
