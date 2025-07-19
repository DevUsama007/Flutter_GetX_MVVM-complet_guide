import 'dart:convert';

import 'package:app_using_getx/data/network/network_api_services.dart';

import '../../model/tredingSongsModel/tendingSongsModel.dart';
import '../../res/app_urls/app_url.dart';

class TrendingSongsRepository {
  final _apiServices = NetworkApiServices();
  Future<List<TrendingSongs>> trendingsongApi() async {
    print("heloo");
    dynamic response = await _apiServices.getApi(AppUrl.trendingSongs);

    return (response as List)
        .map((songJson) => TrendingSongs.fromJson(songJson))
        .toList();
  }

  Future addTredingSong(TrendingSongs data) async {
    print("fjadkfjaskljfdkasjf${data.toJson()}");
    dynamic response =
        await _apiServices.postApi(data.toJson(), AppUrl.insertTrendigSongs);
    return response;
  }

  Future deleteTrendingSong(TrendingSongs data) async {
    print(data.toJson());
    dynamic response =
        await _apiServices.deleteApi(data.toJson(), AppUrl.deleteTrendigSongs);
    return response;
  }
}
