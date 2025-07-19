import 'package:app_using_getx/data/response/status.dart';
import 'package:app_using_getx/model/resources_model/resources_model.dart';
import 'package:app_using_getx/repository/resources_repository/resources_repository.dart';
import 'package:get/get.dart';

class ResourcesViewModel extends GetxController {
  final myResourcesRepo = ResourcesRepository();
  final resources = Resources().obs;
  final rxRequestStatus = Status.LOADING.obs;

  setstatus(Status value) {
    rxRequestStatus.value = value;
  }

  setMyResources(Resources value) {
    resources.value = value;
    print("${resources.value.page} ${resources.value.perPage}");
  }

  getMyResources() async {
    setstatus(Status.LOADING);
    await myResourcesRepo.resouresApi().then(
      (value) {
        setMyResources(value);
        setstatus(Status.COMPLETED);
      },
    ).onError(
      (error, stackTrace) {
        setstatus(Status.ERROR);
        print(error.toString());
      },
    );
  }
}
