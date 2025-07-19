import 'package:app_using_getx/data/response/status.dart';
import 'package:app_using_getx/res/utils/utils.dart';
import 'package:app_using_getx/view_model/controller/my_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDetailView extends StatefulWidget {
  const MyDetailView({super.key});

  @override
  State<MyDetailView> createState() => _MyDetailViewState();
}

class _MyDetailViewState extends State<MyDetailView> {
  final _myDetailViewModel = Get.put(MyDetailViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myDetailViewModel.getMyDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("My Detail"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _myDetailViewModel.refreshMyDetail();
        },
      ),
      body: Obx(
        () {
          switch (_myDetailViewModel.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              return Center(
                child: Text(_myDetailViewModel.showError.toString()),
              );
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: _myDetailViewModel.myDetail.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Utils.showToast(_myDetailViewModel
                            .myDetail.value.data![index].id
                            .toString());
                        print(_myDetailViewModel.myDetail.value.data![index].id
                            .toString());
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(_myDetailViewModel
                              .myDetail.value.data![index].avatar
                              .toString()),
                        ),
                        title: Text(_myDetailViewModel
                            .myDetail.value.data![index].email
                            .toString()),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_myDetailViewModel.myDetail.value.support!.text
                                .toString()),
                            Text(_myDetailViewModel
                                .myDetail.value.data![index].firstName
                                .toString()),
                            Text(_myDetailViewModel
                                .myDetail.value.data![index].lastName
                                .toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
              return Center(
                child: Text("SomeThing Went wrong"),
              );
          }
        },
      ),
    );
  }
}
