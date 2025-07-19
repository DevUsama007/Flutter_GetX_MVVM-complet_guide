import 'package:app_using_getx/data/network/network_api_services.dart';
import 'package:app_using_getx/model/mydetail/my_detail_model.dart';
import 'package:app_using_getx/res/app_urls/app_url.dart';

class MyDetailRepository {
  final _apiServices = NetworkApiServices();
  Future<MyDetail> myDetailApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.mydetailUrl);
    return MyDetail.fromJson(response);
  }
}
