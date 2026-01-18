import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/router/router_module.dart';
import '../../cubit/movies_cubit.dart';
import '../../cubit/movies_state.dart';
import '../widgets/movies_list_section.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesCubit>()..loadAllSections(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TMDB Movies'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                context.push(AppRoutes.search);
              },
            ),
          ],
        ),
        body: const MoviesBody(),
      ),
    );
  }
}

class MoviesBody extends StatelessWidget {
  const MoviesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        final cubit = context.read<MoviesCubit>();

        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            MoviesListSection(
              title: 'Populares',
              section: state.popular,
              onRetry: () => cubit.fetchPopularMovies(),
            ),
            MoviesListSection(
              title: 'Melhores Avaliados',
              section: state.topRated,
              onRetry: () => cubit.fetchTopRatedMovies(),
            ),
            MoviesListSection(
              title: 'Em Alta',
              section: state.trending,
              onRetry: () => cubit.fetchTrendingMovies(),
            ),
            MoviesListSection(
              title: 'Em Breve',
              section: state.upcoming,
              onRetry: () => cubit.fetchUpcomingMovies(),
            ),

            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}
