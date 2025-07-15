import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/presentation/features/home/widgets/search/cubit/search_cubit.dart';

import '../../../results/view/results.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == SearchStatus.success,
      listener: (context, state) {
        if (state.status == SearchStatus.success && state.movies != null) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => Results(movies: state.movies!)),
          );
          context.read<SearchCubit>().reset();
        }
      },
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state.status == SearchStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == SearchStatus.initial) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'Search...',
                  ),
                  onChanged: (value) =>
                      context.read<SearchCubit>().searchQueryChanged(value),
                ),

                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(
                          vertical: 16,
                        ), // only vertical padding
                      ),

                      backgroundColor: WidgetStateProperty.resolveWith((
                        states,
                      ) {
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.grey;
                        }
                        return Theme.of(context).colorScheme.primary;
                      }),
                    ),
                    onPressed: !state.canSearch
                        ? null // Disabled
                        : () => context.read<SearchCubit>().search(), // Enabled
                    child: Text(
                      'Search',
                      style: GoogleFonts.nunito(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          if (state.status == SearchStatus.failure) {
            return Text(state.errorMessage);
          }

          return const Text('Unknown state');
        },
      ),
    );
  }
}
