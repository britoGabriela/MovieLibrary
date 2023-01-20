import 'package:proj_estudos2/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
