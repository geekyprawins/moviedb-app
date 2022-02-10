import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:themoviedb_app/models/config.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  late final base_url;
  late final api_key;
  HTTPService() {
    AppConfig appConfig = getIt<AppConfig>();
    base_url = appConfig.BASE_API_URL;
    api_key = appConfig.API_KEY;
  }

  Future<Response?> get(String path,
      {required Map<String, dynamic> query}) async {
    try {
      String url = "$base_url$path";
      Map<String, dynamic> _query = {
        'api_key': api_key,
        'language': 'en-US',
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(url, queryParameters: _query);
    } on DioError catch (e) {
      print("Unable to GET :(");
      print("Dio Error: $e");
    }
    return null;
  }
}
