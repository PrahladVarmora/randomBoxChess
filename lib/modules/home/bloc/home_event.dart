part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class InitHomeEvent extends HomeEvent {
  const InitHomeEvent();
}

class TapButtonHomeEvent extends HomeEvent {
  final int index;

  const TapButtonHomeEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class ResetHomeEvent extends HomeEvent {
  const ResetHomeEvent();
}
