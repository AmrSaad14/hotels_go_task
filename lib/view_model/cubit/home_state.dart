part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

//select dates

class SelectDateSuccessSatet extends HomeState {}

class ClearSelectedDatesSuccessState extends HomeState {}

class SelectNationalitySuccessState extends HomeState {}

class IncreaseCountSuccessState extends HomeState {}

class DecreaseCountSuccessState extends HomeState {}

class ChangeIsPetAllowedState extends HomeState {}

class SetRoomMatesValuesSuccessState extends HomeState {}

class ClearAllDataSuccessState extends HomeState {}
