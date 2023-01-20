import 'package:flutter/cupertino.dart';
import 'package:proj_estudos2/models/movies_model.dart';
import 'package:proj_estudos2/repositories/movies_repository.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;

  MoviesController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}
