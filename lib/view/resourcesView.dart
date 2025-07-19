import 'package:app_using_getx/data/response/status.dart';
import 'package:app_using_getx/res/colors/appColors.dart';
import 'package:app_using_getx/view_model/controller/resources_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resourcesview extends StatefulWidget {
  const Resourcesview({super.key});

  @override
  State<Resourcesview> createState() => _ResourcesviewState();
}

class _ResourcesviewState extends State<Resourcesview> {
  final resoucresVM = ResourcesViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resoucresVM.getMyResources();
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.amber,
          title: Text(
            "Resources list",
            style: TextStyle(color: AppColors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            resoucresVM.getMyResources();
          },
        ),
        body: Container(
            width: Get.width,
            height: Get.height,
            child: Obx(
              () {
                return resoucresVM.rxRequestStatus.value == Status.LOADING
                    ? Center(
                        child: Stack(
                          children: [
                            Positioned(
                                child: CircularProgressIndicator(
                              strokeWidth: 10,
                            )),
                            Positioned(
                                child: CircularProgressIndicator(
                              strokeWidth: 30,
                            ))
                          ],
                        ),
                      )
                    : Wrap(
                        children: List.generate(
                          resoucresVM.resources.value.data!.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Container(
                                  width: 80,
                                  height: 100,
                                  child: Card(
                                      child: ListTile(
                                    title: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(resoucresVM
                                              .resources.value.data![index].name
                                              .toString()),
                                          Text(resoucresVM
                                              .resources.value.data![index].year
                                              .toString())
                                        ],
                                      ),
                                    ),
                                  )),
                                ),
                              ),
                            );
                          },
                        )
                        // ListView.builder(
                        // itemCount: resoucresVM.resources.value.data!.length,
                        //   itemBuilder: (context, index) {
                        // return Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Card(
                        //     child: Container(
                        //       width: 300,
                        //       height: 100,
                        //       child: Card(
                        //           child: ListTile(
                        //         title: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(resoucresVM
                        //                 .resources.value.data![index].name
                        //                 .toString()),
                        //             Text(resoucresVM
                        //                 .resources.value.data![index].year
                        //                 .toString())
                        //           ],
                        //         ),
                        //       )),
                        //     ),
                        //   ),
                        // );
                        //   },
                        // )
                        ,
                      );
              },
            )));
  }
}
