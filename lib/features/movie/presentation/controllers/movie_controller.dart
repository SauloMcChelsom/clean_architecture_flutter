import 'package:flutter/material.dart';

class MovieController {
 /*
  final GetMoviesUseCase _getMoviesUseCase;

  MovieController(this._getMoviesUseCase){
    fetch();
  }

  ValueNotifier<MovieEntity?> movies = ValueNotifier<MovieEntity?>(null);
  MovieEntity? _cacheMovies;

  onChanged(String value){
    List<MovieDetailsEntity> list = _cachedMovies!.listMovies
      .where(
        (e) => e.toString().toLowerCase().contains((value.toLowerCase())),
      )
      .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    var result = await _getMoviesUseCase();
    
    result.fold(
      (error) => debugPrint(error.toString()),
      (success) => movies.value = success,
    );

    _cacheMovies = movies.value;
  }
  */
}