import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repositories/tmdb_repository.dart';
import 'package:movie_app/presentation/features/details/cubit/details_cubit.dart';
import 'package:movie_app/presentation/features/details/widgets/credits_list.dart';

class Details extends StatelessWidget {
  final int id;

  const Details({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsCubit(repository: context.read<TMDBRepository>())
            ..getDetails(id),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          switch (state.status) {
            case DetailsStatus.initial:
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            case DetailsStatus.loading:
              return Scaffold(body: Center(child: CircularProgressIndicator()));
          // ... inside the success case
            case DetailsStatus.success:

              return Scaffold(
                appBar: AppBar(
                  title: Text(state.movie!.title!),
                  bottomOpacity: 0.2,
                ),
                // Wrap with SingleChildScrollView to prevent overflow
                body: SingleChildScrollView(
                  child: Column(
                    // Add this line to align children to the left
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Stack(
                          clipBehavior: Clip.none, // Allow poster to overflow the stack
                          children: [
                            // Backdrop Image
                            SizedBox(
                              width: double.infinity,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w780${state.movie!.backdropPath ?? state.movie!.posterPath!}',
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Gradient Overlay
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                                      Theme.of(context).scaffoldBackgroundColor,
                                    ],
                                    stops: const [0.0, 0.7, 1.0],
                                  ),
                                ),
                              ),
                            ),
                            // Poster Image
                            Positioned(
                              top: 100, // Position it to overlap the backdrop and body
                              left: 20,
                              child: Container(
                                height: 180, // Slightly larger to stand out
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 2,
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w780${state.movie!.posterPath!}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 100), // Add space for the poster to show

                      // Wrap the text content in Padding
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.movie!.title!}, ${state.movie!.releaseDate!.year}',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Overview',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.movie!.overview!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),

                            SizedBox(height: 20,),

                            Text('Crew', style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(height: 8,),

                            buildCreditsList(state.credits!.crew),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case DetailsStatus.failure:
              return Text('Failure');
          }
        },
      ),
    );
  }
}
