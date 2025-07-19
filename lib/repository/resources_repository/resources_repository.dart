import 'package:app_using_getx/data/network/network_api_services.dart';
import 'package:app_using_getx/model/resources_model/resources_model.dart';
import 'package:app_using_getx/res/app_urls/app_url.dart';

class ResourcesRepository<T> {
  final apiServices = NetworkApiServices();
  Future<Resources> resouresApi() async {
    var response = await apiServices.getApi(AppUrl.resourcesUrl);
    return Resources.fromJson(response);
  }
}
