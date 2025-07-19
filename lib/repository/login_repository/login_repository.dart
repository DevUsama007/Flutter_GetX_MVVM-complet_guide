import 'package:app_using_getx/data/network/network_api_services.dart';
import 'package:app_using_getx/res/app_urls/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data) {
    dynamic response = _apiServices.postApi(data, AppUrl.loginUrl);
    return response;
  }
}
