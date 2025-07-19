import 'package:app_using_getx/homescreen.dart';
import 'package:app_using_getx/example/listGetxExample.dart/listGetxExam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetListUi extends StatefulWidget {
  const GetListUi({super.key});

  @override
  State<GetListUi> createState() => _GetListUiState();
}

class _GetListUiState extends State<GetListUi> {
  ListGet controler = Get.put(ListGet());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("Add To Favourite"),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: List.generate(
                  controler.items.length,
                  (index) {
                    return Card(
                      child: ListTile(
                        trailing: InkWell(
                            onTap: () {
                              if (controler.favourititems
                                  .contains(controler.items[index])) {
                                controler
                                    .removeFavourite(controler.items[index]);
                              } else {
                                controler.addFavourite(controler.items[index]);
                              }
                            },
                            child: Obx(
                              () => Icon(
                                controler.favourititems
                                        .contains(controler.items[index])
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Colors.red,
                              ),
                            )),
                        leading: Icon(Icons.star),
                        title: Text(controler.items[index]),
                      ),
                    );
                  },
                ),
              ),
              // ListView.builder(
              ElevatedButton(
                  onPressed: () {
                    print(controler.favourititems);
                    Get.to(Homescreen());
                  },
                  child: Text("data")),
                  
            ],
          ),
        ),
      ),
    );
  }
}
