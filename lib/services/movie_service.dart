import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'http_service.dart';

import 'package:themoviedb_app/models/movie.dart';

class MovieService {
  final getIt = GetIt.instance;
  HTTPService? httpService;

  MovieService() {
    httpService = getIt.get<HTTPService>();
  }

  Future<List<Movie>?> getPopularMovies({int? page}) async {
    Response? response =
        await httpService!.get('/movie/popular', query: {'page': page});

    if (response!.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      List<Movie>? movies =
          (data['results'].map<Movie>((md) => Movie.fromJson(md))).toList();
      return movies;
    } else {
      throw Exception("Couldn't fetch popular movies :(");
    }
  }

  Future<List<Movie>?> getUpcomingMovies({int? page}) async {
    Response? response =
        await httpService!.get('/movie/upcoming', query: {'page': page});

    if (response!.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      List<Movie>? movies =
          (data['results'].map<Movie>((md) => Movie.fromJson(md))).toList();
      return movies;
    } else {
      throw Exception("Couldn't fetch upcoming movies :(");
    }
  }

  Future<List<Movie>?> searchMovies(String s, {int? page}) async {
    Response? response = await httpService!
        .get('/search/movie', query: {'query': s, 'page': page});

    if (response!.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      List<Movie>? movies =
          (data['results'].map<Movie>((md) => Movie.fromJson(md))).toList();
      return movies;
    } else {
      throw Exception("Couldn't get movies :(");
    }
  }
}
