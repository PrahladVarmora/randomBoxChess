import 'dart:math';

import 'package:bytes_task_darshan/modules/core/utils/core_import.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<InitHomeEvent>(_onInitHomeEvent);
    on<TapButtonHomeEvent>(_onTapButtonHomeEvent);
    on<ResetHomeEvent>(_onResetHomeEvent);
  }

  final random = Random();
  List<int> itemsList = List.generate(24, (index) => index);
  List<int> selectedList = List.empty(growable: true);
  List<int> remainingList = List.empty(growable: true);
  int? currentIndex;
  Box dataBox = Hive.box(AppConfig.hiveDataBox);

  _onInitHomeEvent(InitHomeEvent event, Emitter<HomeState> emit) {
    final bool isDataSet =
        dataBox.get(AppConfig.hiveIsDataSet, defaultValue: false);

    if (isDataSet) {
      getDataFromHive();
    } else {
      remainingList.addAll(itemsList);
      currentIndex = remainingList[random.nextInt(remainingList.length)];
    }
    emit(TapButtonHomeState(currentIndex: currentIndex ?? 0));
  }

  _onTapButtonHomeEvent(TapButtonHomeEvent event, Emitter<HomeState> emit) {
    remainingList.remove(event.index);
    selectedList.add(event.index);
    if (remainingList.isNotEmpty) {
      currentIndex = remainingList[random.nextInt(remainingList.length)];
    } else {
      currentIndex = -1;
    }
    setDataToHive();
    emit(TapButtonHomeState(currentIndex: currentIndex ?? 0));
  }

  _onResetHomeEvent(ResetHomeEvent event, Emitter<HomeState> emit) {
    selectedList.clear();
    remainingList.clear();
    remainingList.addAll(itemsList);
    currentIndex = remainingList[random.nextInt(remainingList.length)];
    setDataToHive();
    emit(TapButtonHomeState(currentIndex: currentIndex ?? 0));
  }

  void getDataFromHive() {
    selectedList.clear();
    selectedList
        .addAll(dataBox.get(AppConfig.hiveSelectedList, defaultValue: []));
    remainingList.clear();
    remainingList
        .addAll(dataBox.get(AppConfig.hiveRemainingList, defaultValue: []));
    currentIndex = dataBox.get(AppConfig.hiveCurrentIndex, defaultValue: -1);
  }

  void setDataToHive() {
    dataBox.put(AppConfig.hiveIsDataSet, true);
    dataBox.put(AppConfig.hiveSelectedList, selectedList);
    dataBox.put(AppConfig.hiveRemainingList, remainingList);
    dataBox.put(AppConfig.hiveCurrentIndex, currentIndex);
  }
}
