import 'package:proj_estudos2/models/movies_model.dart';
import 'package:proj_estudos2/repositories/movies_repository.dart';
import 'package:proj_estudos2/services/dio_service.dart';
import 'package:proj_estudos2/utils/apis_util.dart';


class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(Duration(seconds: 3));
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
