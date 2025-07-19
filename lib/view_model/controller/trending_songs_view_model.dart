import 'dart:convert';

import 'package:app_using_getx/data/response/status.dart';
import 'package:app_using_getx/model/mydetail/my_detail_model.dart';
import 'package:app_using_getx/model/tredingSongsModel/tendingSongsModel.dart';
import 'package:app_using_getx/repository/my_detail_repository/myDetailRepository.dart';
import 'package:app_using_getx/repository/trending_songs_repository/trending_songs_repository.dart';
import 'package:app_using_getx/res/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TrendingSongsViewModel extends GetxController {
  final _trendingSongsRepository = TrendingSongsRepository();
  final title = TextEditingController().obs;
  final discription = TextEditingController().obs;
  final singer = TextEditingController().obs;
  final thumbnail = TextEditingController().obs;
  final fileName = TextEditingController().obs;
  final rxRequestStatus = Status.COMPLETED.obs;
  final trendingSongs = <TrendingSongs>[].obs;
  RxString showError = "".obs;
  setRxRequestStatus(Status _value) {
    rxRequestStatus.value = _value;
  }

  // setTrendingSongs(TrendingSongs _value) {
  //   trendingSongs.value = _value as List<TrendingSongs>;
  //   print('trending Songs list is ${trendingSongs.value}');
  // }

  getTrendingSongs() async {
    try {
      TrendingSongs();
      print("object");
      setRxRequestStatus(Status.LOADING);
      print("object2");
      trendingSongs.value = await _trendingSongsRepository.trendingsongApi();
      setRxRequestStatus(Status.COMPLETED);
      print(trendingSongs.value.length);
    } catch (e) {
      showError.value = e.toString();

      setRxRequestStatus(Status.ERROR);
    }
  }

//function to refresh the page
  refreshTrendingSong() {
    setRxRequestStatus(Status.LOADING);
    _trendingSongsRepository.trendingsongApi().then(
      (value) {
        setRxRequestStatus(Status.COMPLETED);
        // setTrendingSongs(value);
      },
    ).onError(
      (error, stackTrace) {
        showError.value = error.toString();

        setRxRequestStatus(Status.ERROR);
      },
    );
  }

  addTrendingsong(var data) {
    setRxRequestStatus(Status.LOADING);

    _trendingSongsRepository.addTredingSong(data).then(
      (value) {
        print(value);
        setRxRequestStatus(Status.COMPLETED);
      },
    ).onError(
      (error, stackTrace) {
        setRxRequestStatus(Status.ERROR);

        print("ddddddddddddddddddddddddddddddddd");
        print(error);
        throw error.toString();
      },
    );
  }

  validate() {
    print("object");
    if (title.value.text == "" ||
        discription.value.text == "" ||
        singer.value.text == '' ||
        thumbnail.value.text == "" ||
        fileName.value.text == '') {
      Utils.showToast("Chechk the field");
    } else {
      final data = TrendingSongs(
          id: "",
          title: title.value.text,
          discription: discription.value.text,
          singer: singer.value.text,
          thumbnail: thumbnail.value.text,
          fileName: fileName.value.text);

      addTrendingsong(data);
    }
  }

  deletTrendingSongs(String id) {
    final songId = TrendingSongs(
      id: id,
      // title: "",
      // discription: "",
      // singer: "",
      // thumbnail: "",
      // fileName: ""
    );

    _trendingSongsRepository.deleteTrendingSong(songId).then(
      (value) {
        print(value);
        getTrendingSongs();
      },
    ).onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }
}
