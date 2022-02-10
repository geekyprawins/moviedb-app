import 'package:get_it/get_it.dart';
import 'http_service.dart';

class MovieService {
  final getIt = GetIt.instance;
  HTTPService? httpService;

  MovieService() {
    httpService = getIt.get<HTTPService>();
  }
}
