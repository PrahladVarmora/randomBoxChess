import 'package:bytes_task_darshan/modules/home/view/screen_home.dart';
import 'package:bytes_task_darshan/modules/splash/view/screen_splash.dart';

import 'core_import.dart';

/// > RouteGenerator is a class that generates routes for the application
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    printWrapped('\x1B[32m${'Navigating to ----> ${settings.name}'}\x1B[0m');
    switch (settings.name) {
      case AppRoutes.routesSplash:
        return MaterialPageRoute(
            builder: (_) => const ScreenSplash(),
            settings: const RouteSettings(name: AppRoutes.routesSplash));

      case AppRoutes.routesDashboard:
        return PageRouteBuilder(
            transitionDuration: const Duration(seconds: 0),
            pageBuilder: (context, animation1, animation2) =>
                const ScreenDashboard(),
            settings: const RouteSettings(name: AppRoutes.routesDashboard));
      default:
        return MaterialPageRoute(
            builder: (_) => const ScreenSplash(),
            settings: const RouteSettings(name: AppRoutes.routesSplash));
    }
  }
}
