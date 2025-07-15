import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/repositories/tmdb_repository.dart';
import 'package:movie_app/data/services/tmdb_service.dart';
import 'package:movie_app/presentation/features/home/view/home.dart';
import 'package:movie_app/presentation/features/home/widgets/search/cubit/search_cubit.dart';

void main() {
  runApp(WidgetTree());
}

class WidgetTree extends StatelessWidget {

  final TMDBService tmdbService = TMDBService();

  WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => TMDBRepository(service: tmdbService)),
      ],
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => SearchCubit(repository: context.read<TMDBRepository>())),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.blue.shade600,
              onPrimary: Colors.white,
              secondary: Colors.white,
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              surface: Colors.black,
              onSurface: Colors.grey.shade300,
            ),
          ),
          home: Home(),
        ),
      ),
    );
  }
}
