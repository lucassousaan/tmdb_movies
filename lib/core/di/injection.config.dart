// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/movies/data/datasource/movies_datasource.dart' as _i651;
import '../../features/movies/data/repository/movies_repository_impl.dart'
    as _i203;
import '../../features/movies/domain/repository/movies_repository.dart'
    as _i188;
import '../../features/movies/domain/usecases/get_popular_movies.dart' as _i995;
import '../../features/movies/domain/usecases/get_top_rated_movies.dart'
    as _i1024;
import '../../features/movies/domain/usecases/get_trending_movies.dart'
    as _i629;
import '../../features/movies/domain/usecases/get_upcoming_movies.dart' as _i77;
import '../../features/movies/presentation/cubit/movies_cubit.dart' as _i957;
import '../../features/search/data/datasource/search_datasource.dart' as _i213;
import '../../features/search/data/repository/search_repository_impl.dart'
    as _i130;
import '../../features/search/domain/repository/search_repository.dart'
    as _i535;
import '../../features/search/domain/usecases/search_movies.dart' as _i763;
import '../../features/search/presentation/bloc/search_bloc.dart' as _i552;
import '../network/auth_interceptor.dart' as _i908;
import '../network/network_module.dart' as _i200;
import '../router/router_module.dart' as _i948;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final routerModule = _$RouterModule();
  final networkModule = _$NetworkModule();
  gh.factory<_i908.AuthInterceptor>(() => _i908.AuthInterceptor());
  gh.singleton<_i583.GoRouter>(() => routerModule.router);
  gh.lazySingleton<_i361.Dio>(
    () => networkModule.dio(gh<_i908.AuthInterceptor>()),
  );
  gh.factory<_i651.MoviesDatasource>(
    () => _i651.MoviesDatasource(gh<_i361.Dio>()),
  );
  gh.factory<_i213.SearchDatasource>(
    () => _i213.SearchDatasource(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i535.ISearchRepository>(
    () => _i130.SearchRepositoryImpl(gh<_i213.SearchDatasource>()),
  );
  gh.lazySingleton<_i188.IMoviesRepository>(
    () => _i203.MoviesRepositoryImpl(gh<_i651.MoviesDatasource>()),
  );
  gh.factory<_i995.GetPopularMovies>(
    () => _i995.GetPopularMovies(gh<_i188.IMoviesRepository>()),
  );
  gh.factory<_i1024.GetTopRatedMovies>(
    () => _i1024.GetTopRatedMovies(gh<_i188.IMoviesRepository>()),
  );
  gh.factory<_i629.GetTrendingMovies>(
    () => _i629.GetTrendingMovies(gh<_i188.IMoviesRepository>()),
  );
  gh.factory<_i77.GetUpcomingMovies>(
    () => _i77.GetUpcomingMovies(gh<_i188.IMoviesRepository>()),
  );
  gh.factory<_i763.SearchMovies>(
    () => _i763.SearchMovies(gh<_i535.ISearchRepository>()),
  );
  gh.factory<_i552.SearchBloc>(
    () => _i552.SearchBloc(gh<_i763.SearchMovies>()),
  );
  gh.factory<_i957.MoviesCubit>(
    () => _i957.MoviesCubit(
      gh<_i995.GetPopularMovies>(),
      gh<_i1024.GetTopRatedMovies>(),
      gh<_i629.GetTrendingMovies>(),
      gh<_i77.GetUpcomingMovies>(),
    ),
  );
  return getIt;
}

class _$RouterModule extends _i948.RouterModule {}

class _$NetworkModule extends _i200.NetworkModule {}
