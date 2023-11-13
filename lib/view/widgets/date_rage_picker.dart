import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go_task/view_model/cubit/home_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRagePicker extends StatelessWidget {
  const DateRagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.all(10.sp),
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
        child: SfDateRangePicker(
          view: DateRangePickerView.month,
          showNavigationArrow: true,
          selectionMode: DateRangePickerSelectionMode.range,
          showActionButtons: true,
          controller: homeCubit.dateRangePickerController,
          onSubmit: (values) {
            homeCubit.selectDate();
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
        ),
      );
    });
  }
}
