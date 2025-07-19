import 'package:app_using_getx/data/response/status.dart';
import 'package:app_using_getx/res/utils/utils.dart';
import 'package:app_using_getx/view_model/controller/trending_songs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingSongsView extends StatefulWidget {
  const TrendingSongsView({super.key});

  @override
  State<TrendingSongsView> createState() => _TrendingSongsViewState();
}

class _TrendingSongsViewState extends State<TrendingSongsView> {
  final _trendingSongControler = Get.put(TrendingSongsViewModel());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("object");
    _trendingSongControler.getTrendingSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _trendingSongControler.getTrendingSongs();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Trending Song'),
      ),
      body: Obx(
        () {
          switch (_trendingSongControler.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                child: Text(_trendingSongControler.showError.toString()),
              );

            case Status.COMPLETED:
              return ListView.builder(
                itemCount: _trendingSongControler.trendingSongs.length,
                itemBuilder: (context, index) {
                  final song = _trendingSongControler.trendingSongs[index];
                  return Card(
                    child: ListTile(
                      trailing: GestureDetector(
                        onTap: () {
                          _trendingSongControler
                              .deletTrendingSongs(song.id.toString());
                          Utils.showToast('show message${song.id}');
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                      // leading: Image.network(song.thumbnail.toString()),
                      title: Text(song.singer.toString()),
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
