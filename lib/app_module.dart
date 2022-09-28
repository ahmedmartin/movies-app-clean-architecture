import 'package:app_example/core/http_client/dio_implementation.dart';
import 'package:app_example/data/datasources/actor_remote_datasource.dart';
import 'package:app_example/data/datasources/movie_remote_datasource.dart';
import 'package:app_example/data/repositories/actor_repository_implementation.dart';
import 'package:app_example/data/repositories/genre_repository_implementation.dart';
import 'package:app_example/data/repositories/movie_repository_implementation.dart';
import 'package:app_example/domain/usecases/get_act_images_usecase.dart';
import 'package:app_example/domain/usecases/get_cast_usecase.dart';
import 'package:app_example/domain/usecases/get_movie_detail.dart';
import 'package:app_example/domain/usecases/get_videos_usecase.dart';
import 'package:app_example/domain/usecases/search_movies_usecase.dart';
import 'package:app_example/presentation/blocs/actor/actor_bloc.dart';
import 'package:app_example/presentation/blocs/cast/bloc/cast_bloc.dart';
import 'package:app_example/presentation/blocs/cubit/animation/animation_cubit.dart';
import 'package:app_example/presentation/blocs/genres_bloc/genre_bloc.dart';
import 'package:app_example/presentation/blocs/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:app_example/presentation/blocs/movies/movies_bloc.dart';
import 'package:app_example/presentation/blocs/search_movies/bloc/search_movies_bloc.dart';
import 'package:app_example/presentation/blocs/videos/bloc/videos_bloc.dart';
import 'package:app_example/presentation/screens/actor_details.dart';

import 'package:app_example/presentation/screens/home_screen.dart';
import 'package:app_example/presentation/screens/movie_detail_screen.dart';
import 'package:app_example/presentation/screens/watch_videos/watch_videos_screen.dart';
import 'package:app_example/presentation/widgets/actor_details/actor_detail_arguments.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/http_client/http_client.dart';
import 'data/datasources/genre_remote_datasource.dart';
import 'domain/usecases/get_all_genres_usecase.dart';
import 'domain/usecases/get_popular_movie_by_genre_usecase.dart';
import 'domain/usecases/get_now_playing_movies_usecase.dart';
import 'domain/usecases/get_popular_movies_usecase.dart';
import 'domain/usecases/get_top_rated_movies_usecase.dart';
import 'domain/usecases/get_trending_movies_usecase.dart';
import 'domain/usecases/get_upcoming_movies_usecase.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => GenreBloc(i())),
        Bind.factory((i) => MoviesBloc(i(), i(), i(), i(), i(), i())),
        Bind.factory((i) => MovieDetailBloc(i(), i(), i())),
        Bind.factory((i) => ActorBloc(i())), //---
        Bind.factory((i) => CastBloc(i())),
        Bind.factory((i) => VideosBloc(i())),
        Bind.factory((i) => ActorBloc(i())),
        Bind.factory((i) => SearchMoviesBloc(i())),
        Bind.factory((i) => MovieRemoteDataSourceImplementation(i())),
        Bind.factory((i) => Dio(
              BaseOptions(
                baseUrl: "https://api.themoviedb.org/3",
                headers: {
                  'api-key': '',
                  'contentType': 'application/json; charset=utf-8',
                  'language': 'en-US',
                  'authorization':
                      'Bearer '
                },
              ),
            )),
        Bind.lazySingleton<HttpClient>((i) => DioHttpClientImplementation(i())),
        Bind.lazySingleton((i) => MovieRepositoryImplementation(i())),
        Bind.lazySingleton((i) => GetNowPlayingMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetPopularMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetTopRatMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetTrendingMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetUpcomingMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetMovieDetailUsecase(i())),
        Bind.factory((i) => AnimationCubit()),
        Bind.lazySingleton((i) => GenreRemoteDatasourceImplementation(i())),
        Bind.lazySingleton((i) => ActorRemoteDatasourceImplementation(i())),//----
        Bind.lazySingleton((i) => GenreRepositoryImplementation(i())),
        Bind.lazySingleton((i) => ActorRepositoryImplementation(i())),//---
        Bind.lazySingleton((i) => GetAllGenresUsecase(i())),
        Bind.lazySingleton((i) => GetMovieByGenreUsecase(i())),
        Bind.lazySingleton((i) => GetCastUsecase(i())),
        Bind.lazySingleton((i) => GetVideosUsecase(i())),
        Bind.lazySingleton((i) => GetActImagesUsecase(i())), //---
        Bind.lazySingleton((i) => SearchMoviesUsecase(i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const HomeScreen()),
    ChildRoute(
      '/detail',
      child: (context, args) => MovieDetailScreen(
        movieDetailArguments: args.data,
      ),
    ),
    ChildRoute(
      '/videos',
      child: (context, args) =>
          WatchVideosScreen(watchVideoArguments: args.data),
    ),
    ChildRoute(
      '/actor_details',
      child: (context, args) =>
          Actor_details(actorDetailArguments: args.data),
    ),
  ];
}
