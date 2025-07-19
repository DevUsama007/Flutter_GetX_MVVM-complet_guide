import 'package:app_using_getx/custome_widget.dart/button.dart';
import 'package:app_using_getx/data/response/status.dart';
import 'package:app_using_getx/model/tredingSongsModel/tendingSongsModel.dart';
import 'package:app_using_getx/view/trendingSongs/textFieldWidget.dart';
import 'package:app_using_getx/view_model/controller/trending_songs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addtrendingsong extends StatefulWidget {
  const Addtrendingsong({super.key});

  @override
  State<Addtrendingsong> createState() => _AddtrendingsongState();
}

class _AddtrendingsongState extends State<Addtrendingsong> {
  final _controller = Get.put(TrendingSongsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Trending Songs'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Obx(
            () {
              return Column(
                children: [
                  Textfieldwidget(
                          controller: _controller.title.value,
                          hint: 'Enter the title',
                          title: 'Song Title')
                      .paddingOnly(bottom: 20),
                  Textfieldwidget(
                          controller: _controller.discription.value,
                          hint: 'Enter the Description',
                          title: 'Song Description')
                      .paddingOnly(bottom: 20),
                  Textfieldwidget(
                          controller: _controller.singer.value,
                          hint: 'Enter the singer',
                          title: 'Singer Name')
                      .paddingOnly(bottom: 20),
                  Textfieldwidget(
                          controller: _controller.thumbnail.value,
                          hint: 'Thumbnail',
                          title: 'Song Thumbnail')
                      .paddingOnly(bottom: 20),
                  Textfieldwidget(
                          controller: _controller.fileName.value,
                          hint: 'Enter the File Name',
                          title: 'Song Filename')
                      .paddingOnly(bottom: 20),
                  _controller.rxRequestStatus.value == Status.LOADING
                      ? CircularProgressIndicator()
                      : _controller.rxRequestStatus.value == Status.COMPLETED
                          ? Button(
                              title: 'Add Song',
                              ontap: () {
                                _controller.validate();
                              },
                              loading: false)
                          : _controller.rxRequestStatus.value == Status.ERROR
                              ? Text("Unexpected Error Occur")
                              : Text("default")
                ],
              ).paddingSymmetric(horizontal: 20, vertical: 20);
            },
          )),
    );
  }
}
