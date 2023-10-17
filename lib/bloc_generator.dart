import 'package:bytes_task_darshan/modules/core/utils/core_import.dart';
import 'package:bytes_task_darshan/modules/home/bloc/home_bloc.dart';

class BlocGenerator {
  static generateBloc() {
    return [
      BlocProvider(create: (_) => HomeBloc()..add(const InitHomeEvent())),
    ];
  }
}
