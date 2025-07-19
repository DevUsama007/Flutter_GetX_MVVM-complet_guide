import 'package:app_using_getx/view_model/all_user_data_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart'; // Assuming this is where your service is located

class UserListScreen extends StatelessWidget {
  final AllUserDataServices allUserDataServices =
      Get.put(AllUserDataServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Obx(
          () => allUserDataServices.loading.value
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: CircularProgressIndicator(),
                ))
              : Column(
                  children: List.generate(
                    allUserDataServices.list.length,
                    (index) {
                      return Obx(
                        () => Card(
                          child: ListTile(
                            leading: Text(index.toString()),
                            title:
                                Text(allUserDataServices.list[index]['email']),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: allUserDataServices.loading.value
            ? () {
                print(allUserDataServices.loading.value);
              }
            : () {
                // Call getUserData to fetch the data
                allUserDataServices.getUserData();
              },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
