import 'package:app_using_getx/data/network/network_api_services.dart';
import 'package:app_using_getx/res/app_urls/app_url.dart';

class AllUserDataRepository {
  final userData = NetworkApiServices();
  Future getAllUserData() async {
    var response = userData.getApi(AppUrl.userDataModelUrl);
    return response;
  }
}
