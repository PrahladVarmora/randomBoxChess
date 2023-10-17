import 'package:bloc_test/bloc_test.dart';
import 'package:bytes_task_darshan/modules/core/utils/core_import.dart';
import 'package:bytes_task_darshan/modules/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

const testMockStorage = './test/fixtures';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel(
    'plugins.flutter.io/path_provider',
  );
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'getApplicationDocumentsDirectory':
        return testMockStorage;
      default:
    }
  });

  await Hive.initFlutter();
  await Hive.openBox(AppConfig.hiveDataBox);

  group("home bloc test: ", () {
    HomeBloc homeBloc = HomeBloc();
    test("Initial State", () {
      expect(homeBloc.state, HomeInitial());
    });

    blocTest<HomeBloc, HomeState>(
      'emits [TapButtonHomeState] when InitHomeEvent',
      build: () => HomeBloc(),
      act: (cubit) async {
        cubit.add(const InitHomeEvent());
      },
      expect: () => [isA<TapButtonHomeState>()],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [TapButtonHomeState] when TapButtonHomeEvent',
      build: () => HomeBloc(),
      act: (cubit) async {
        cubit.add(const TapButtonHomeEvent(index: 1));
      },
      expect: () => [isA<TapButtonHomeState>()],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [TapButtonHomeState] when ResetHomeEvent',
      build: () => HomeBloc(),
      act: (cubit) {
        cubit.add(const ResetHomeEvent());
      },
      expect: () => [isA<TapButtonHomeState>()],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [TapButtonHomeState] when InitHomeEvent with HiveDataSet = true',
      build: () => HomeBloc(),
      act: (cubit) async {
        homeBloc.dataBox.put(AppConfig.hiveIsDataSet, true);
        cubit.add(const InitHomeEvent());
      },
      expect: () => [isA<TapButtonHomeState>()],
    );
  });
}
