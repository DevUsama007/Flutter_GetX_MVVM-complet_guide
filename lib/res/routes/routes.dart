import 'package:app_using_getx/homescreen.dart';
import 'package:app_using_getx/res/routes/routes_name.dart';
import 'package:app_using_getx/example/screenOne.dart';
import 'package:app_using_getx/view/login.dart';
import 'package:app_using_getx/view/myDetailView.dart';
import 'package:app_using_getx/view/register.dart';
import 'package:app_using_getx/view/resourcesView.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../view/trendingSongs/addTrendingSong.dart';
import '../../view/trendingSongs/trendingSongsView.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: RouteName.homescreen,
        page: () => const Homescreen(),
        transition: Transition.fade,
      ),
      GetPage(
        name: RouteName.screenOne,
        page: () => Screenone(),
      ),
      GetPage(
        name: RouteName.register,
        page: () => Register(),
      ),
      GetPage(
        name: RouteName.login,
        page: () => Login(),
      ),
      GetPage(
        name: RouteName.myDetailView,
        page: () => MyDetailView(),
      ),
      GetPage(
        name: RouteName.resourcesView,
        page: () => Resourcesview(),
      ),
      GetPage(
        name: RouteName.trendingsongs,
        page: () => TrendingSongsView(),
      ),
      GetPage(
        name: RouteName.addtrendingsong,
        page: () => Addtrendingsong(),
      ),
    ];
  }
}
