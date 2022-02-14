import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';

import 'package:themoviedb_app/models/main_page_data.dart';
import 'package:themoviedb_app/models/search_category.dart';
import 'package:themoviedb_app/services/movie_service.dart';
import 'package:themoviedb_app/models/movie.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController({MainPageData? state})
      : super(state ?? MainPageData.initial()) {
    getMovies();
  }
  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie>? movies = [];

      if (state.searchText.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          movies = await _movieService.getPopularMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.upcoming) {
          movies = await _movieService.getUpcomingMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.none) {
          movies = [];
        }
      } else {
        //Perform Text Search
        movies = await _movieService.searchMovies(state.searchText);
      }
      state = state.copyWith(
        movies: [...state.movies, ...movies!],
        page: state.page + 1,
      );
    } catch (e) {
      rethrow;
    }
  }

  void updateSearchCategory(String s) {
    try {
      state = state.copyWith(
        movies: [],
        page: 1,
        searchCategory: s,
        searchText: '',
      );
      getMovies();
    } catch (e) {
      print(e);
    }
  }

  void updateTextSearch(String s) {
    try {
      state = state.copyWith(
        movies: [],
        page: 1,
        searchCategory: SearchCategory.none,
        searchText: s,
      );
      getMovies();
    } catch (e) {
      print(e);
    }
  }

  // ProviderListenable<ProviderListenable<MainPageData>> getstate() => state;

}
