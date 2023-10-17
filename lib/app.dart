import 'package:bytes_task_darshan/bloc_generator.dart';
import 'package:bytes_task_darshan/modules/core/utils/core_import.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

/// Used by [MyApp] StatefulWidget for init of app
///[MultiProvider] A provider that merges multiple providers into a single linear widget tree.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

///[MyAppState] This class use to My App State
class MyAppState extends State<MyApp> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(AppConfig.hiveDataBox);
  }

  @override
  Widget build(BuildContext context) {
    addingMobileUiStyles(context);

    return MultiProvider(
      providers: BlocGenerator.generateBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        title: APPStrings.appName,
        navigatorKey: NavigatorKey.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }

  /// Used by [SystemChrome] of app
  void addingMobileUiStyles(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: (Theme.of(context).brightness == Brightness.light)
          ? AppColors.colorPrimary
          : Colors.transparent,
      statusBarIconBrightness:
          (Theme.of(context).brightness == Brightness.light)
              ? Brightness.light
              : Brightness.dark,
      statusBarBrightness: (Theme.of(context).brightness == Brightness.light)
          ? Brightness.dark
          : Brightness.light,
    ));
  }
}
