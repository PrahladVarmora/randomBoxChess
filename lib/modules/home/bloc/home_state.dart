part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class TapButtonHomeLoading extends HomeState {}

class TapButtonHomeState extends HomeState {
  final int currentIndex;

  const TapButtonHomeState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
