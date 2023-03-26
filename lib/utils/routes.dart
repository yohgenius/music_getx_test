import 'package:get/get.dart';
import 'package:music_player_test/view/pages/dashboard/dashboard_screen.dart';
import 'package:music_player_test/view/pages/music_player/player_screen.dart';
import 'package:music_player_test/view/pages/search/search_screen.dart';

appRoutes() =>
    [

      GetPage(name: '/dashboard', page: () => DashboardScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500),),
      GetPage(name: '/search', page: () => SearchScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500),),
      GetPage(name: '/audio_player', page: () => PlayerPage(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 500),),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }
}