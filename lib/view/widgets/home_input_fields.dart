import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go_task/core/widgets/modal_bottom_sheet.dart';
import 'package:hotels_go_task/core/widgets/primary_form_field.dart';
import 'package:hotels_go_task/core/widgets/show_popup_menu.dart';
import 'package:hotels_go_task/view/widgets/date_rage_picker.dart';
import 'package:hotels_go_task/view_model/cubit/home_cubit.dart';

class HomeInputFields extends StatefulWidget {
  const HomeInputFields({
    super.key,
  });

  @override
  State<HomeInputFields> createState() => _HomeInputFieldsState();
}

class _HomeInputFieldsState extends State<HomeInputFields> {
  final GlobalKey nationalityKey = GlobalKey();
  final GlobalKey roomMatesKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryTextFormField(
              isWithBorder: true,
              height: 50.h,
              controller: homeCubit.cityController,
            ),
            SizedBox(
              height: 5.h,
            ),
            PrimaryTextFormField(
              containerBorderRaides: 5.r,
              borderRaides: 5.r,
              formFieldBorderColor: Colors.blue.shade700,
              isWithBorder: true,
              height: 50.h,
              hintText: 'Select Dates',
              controller: homeCubit.dateRangeController,
              readOnly: true,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const DateRagePicker();
                    });
              },
              suffixWidget: InkWell(
                onTap: () {
                  homeCubit.clearSelectedDate();
                },
                child: const Icon(
                  Icons.close,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            PrimaryTextFormField(
              key: nationalityKey,
              onTap: () {
                showPrimaryMenu(
                  context: context,
                  key: nationalityKey,
                  items: homeCubit.nationalities
                      .map(
                        (e) => PopupMenuItem(
                          child: Text(
                            e,
                          ),
                          onTap: () {
                            homeCubit.selectNationality(nationality: e);
                          },
                        ),
                      )
                      .toList(),
                );
              },
              height: 50.h,
              controller: homeCubit.nationalityController,
              hintText: 'Select nationality',
              readOnly: true,
              suffixWidget: const RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            PrimaryTextFormField(
              height: 50.h,
              readOnly: true,
              hintText: 'Select Room mates',
              controller: homeCubit.roomMatesController,
              onTap: () {
                showFindHotlesBottomSheet(context);
              },
              suffixWidget: const RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
