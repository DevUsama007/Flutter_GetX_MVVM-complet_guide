import 'package:app_using_getx/data/response/status.dart';
import 'package:app_using_getx/model/mydetail/my_detail_model.dart';
import 'package:app_using_getx/repository/my_detail_repository/myDetailRepository.dart';
import 'package:get/get.dart';

class MyDetailViewModel extends GetxController {
  final _myDetailRepository = MyDetailRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final myDetail = MyDetail().obs;
  RxString showError = "".obs;
  setRxRequestStatus(Status _value) {
    rxRequestStatus.value = _value;
  }

  setMyDetail(MyDetail _value) {
    myDetail.value = _value;
  }

  getMyDetail() {
    print("helooooo");
    setRxRequestStatus(Status.LOADING);
    _myDetailRepository.myDetailApi().then(
      (value) {
        setRxRequestStatus(Status.COMPLETED);
        setMyDetail(value);
      },
    ).onError(
      (error, stackTrace) {
        showError.value = error.toString();

        setRxRequestStatus(Status.ERROR);
      },
    );
  }

//function to refresh the page
  refreshMyDetail() {
    setRxRequestStatus(Status.LOADING);
    _myDetailRepository.myDetailApi().then(
      (value) {
        setRxRequestStatus(Status.COMPLETED);
        setMyDetail(value);
      },
    ).onError(
      (error, stackTrace) {
        showError.value = error.toString();

        setRxRequestStatus(Status.ERROR);
      },
    );
  }
}
