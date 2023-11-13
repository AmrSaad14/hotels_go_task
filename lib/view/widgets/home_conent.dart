import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go_task/view/widgets/home_input_fields.dart';
import 'package:hotels_go_task/view_model/cubit/home_cubit.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              height: 270.h,
              margin: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),
              padding: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        homeCubit.clearAllData();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Find Hotels',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20.sp,
                          )
                        ],
                      ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade800,
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const HomeInputFields(),
              ),
            ),
          ],
        );
      },
    );
  }
}
