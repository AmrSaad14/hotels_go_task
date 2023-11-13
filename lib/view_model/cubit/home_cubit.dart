import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_go_task/main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'home_state.dart';

HomeCubit homeCubit = HomeCubit.get(navigatorkey.currentContext!);

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

//home controllers
  TextEditingController cityController = TextEditingController();
  TextEditingController dateRangeController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController roomMatesController = TextEditingController();

  List<String> nationalities = [
    'Egyption',
    'Saudi',
    'Sudan',
    'Emarates',
    'Qatar',
  ];

// select date rang
  DateRangePickerController dateRangePickerController =
      DateRangePickerController();

  void selectDate() {
    if (dateRangePickerController.selectedRange != null) {
      String startDate = dateRangePickerController.selectedRange!.startDate
          .toString()
          .split(' ')
          .first;

      String endDate = dateRangePickerController.selectedRange!.endDate
          .toString()
          .split(' ')
          .first;

      dateRangeController.text = '$startDate ==> $endDate';
      debugPrint('selected Ranges are $startDate ==> $endDate');

      emit(SelectDateSuccessSatet());
    }
  }

  void clearSelectedDate() {
    dateRangeController.clear();
    dateRangePickerController.selectedRange = null;
    emit(ClearSelectedDatesSuccessState());
  }

  void selectNationality({required String nationality}) {
    nationalityController.text = nationality;
    emit(SelectNationalitySuccessState());
  }

  // ---------------------- select room mates ----------------------

  int roomCount = 1;

  void increaseRoomCount() {
    roomCount++;
    emit(IncreaseCountSuccessState());
  }

  void decreaseRoomCount() {
    if (roomCount > 1) {
      roomCount--;
      emit(DecreaseCountSuccessState());
    }
  }

  int adultCount = 0;

  void increaseAdultCount() {
    adultCount++;
    emit(IncreaseCountSuccessState());
  }

  void decreaseAdultCount() {
    if (adultCount > 0) {
      adultCount--;
      emit(DecreaseCountSuccessState());
    }
  }

  int childCount = 0;

  void increaseChildCount() {
    childCount++;
    emit(IncreaseCountSuccessState());
  }

  void decreaseChildCount() {
    if (childCount > 0) {
      childCount--;
      emit(DecreaseCountSuccessState());
    }
  }

  bool isPetAllowed = false;

  void changeIsPetAllowed() {
    isPetAllowed = !isPetAllowed;
    emit(ChangeIsPetAllowedState());
  }

  void setRoomMatesValues() {
    roomMatesController.text =
        '$roomCount Room, $adultCount Adult, $childCount Children';
    clearRoomMatesBottomSheetValues();
    emit(SetRoomMatesValuesSuccessState());
  }

  void clearRoomMatesBottomSheetValues() {
    roomCount = 1;
    adultCount = 0;
    childCount = 0;
    isPetAllowed = false;
  }

  void clearAllData() {
    cityController.clear();
    dateRangeController.clear();
    nationalityController.clear();
    roomMatesController.clear();
    dateRangePickerController.selectedRange = null;
    emit(ClearAllDataSuccessState());
  }
}
