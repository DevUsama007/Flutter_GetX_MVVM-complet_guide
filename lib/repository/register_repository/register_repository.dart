

import 'package:app_using_getx/data/network/network_api_services.dart';
import 'package:app_using_getx/res/app_urls/app_url.dart';

class RegisterRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> registerApi(var data) {
    print(data);
    dynamic response = _apiServices.postApi(data, AppUrl.registerUrl);

    return response;
  }
}
