import 'package:dio/dio.dart';
import 'package:proj_estudos2/services/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl:
            'https://api.themoviedb.org/4/',
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNzk0MWQ3ODMxZGZlYzYwNTkxMTc5YmFlODk5YWI5NiIsInN1YiI6IjYzYWM1YjAwN2VmMzgxMWY2MDg1MGYwMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FVrLcZfQid2nVrnRTtoU2hNogVlGYGsyWKPNL3Uhbi0'
        },
      ),
    );
  }
}
