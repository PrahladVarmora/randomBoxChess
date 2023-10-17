import 'package:bytes_task_darshan/modules/core/utils/core_import.dart';

/// This class is a stateless widget that displays a splash screen
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() {
    Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() async {
      Navigator.pushNamedAndRemoveUntil(
        getNavigatorKeyContext(),
        AppRoutes.routesDashboard,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: Center(
        child: Text(
          APPStrings.appName,
          style: Theme.of(context).primaryTextTheme.headlineLarge,
        ),
      ),
    );
  }
}
